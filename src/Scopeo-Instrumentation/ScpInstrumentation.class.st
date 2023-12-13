Class {
	#name : #ScpInstrumentation,
	#superclass : #Object,
	#instVars : [
		'linkForAssignment',
		'linkForInvocation',
		'handler',
		'imageMethods',
		'methodsToInstrument',
		'classesOfMethodsToInstrument',
		'linkForMessageSend',
		'linkForMethodCall',
		'errors',
		'identifier',
		'indirectionReceiverNode'
	],
	#category : #'Scopeo-Instrumentation'
}

{ #category : #private }
ScpInstrumentation class >> uninstallAll [

	<script: 'self uninstallAll'>
	
	ScpInstrumentationRegistry instance valuesDo: [ :i | 
		i instrumentation uninstall
	]

]

{ #category : #parameters }
ScpInstrumentation >> handler: aHandler [

	handler := aHandler



	
]

{ #category : #initialization }
ScpInstrumentation >> initialize [

	identifier := ScpInstrumentationRegistry instance size + 1.
	indirectionReceiverNode := RBParser parseExpression: (
		'ScpInstrumentationRegistry instance at: {1}' format: { identifier }
	)
]

{ #category : #services }
ScpInstrumentation >> install [

	self methodsToInstrument do: [ :method |
		"self instrumentMethodCall: method.
		self instrumentMessageSends: method."
		self instrumentAssignments: method.
	]
]

{ #category : #private }
ScpInstrumentation >> instrumentAssignments: aMethod [

	aMethod ast instanceVariableWriteNodes do: [ :node |		
		ScpAssignmentIndirection new 
			for: node parent;
			handler: handler;
			selector: #onAssignment:of:value:;
			arguments: { node name . #self . node parent value };
			install.
	]
]

{ #category : #private }
ScpInstrumentation >> instrumentMessageSends: aMethod [
	
	| nodes |
	
	nodes := aMethod ast sendNodes.
	nodes := nodes reject: [ :n | n receiver isBlock ].
	nodes do: [ :node |
		node linkIfAbsent: self linkForMessageSend.
	]
]

{ #category : #private }
ScpInstrumentation >> instrumentMethodCall: aMethod [

	aMethod ast linkIfAbsent: self linkForMethodCall.
]

{ #category : #private }
ScpInstrumentation >> linkForAssignment [

	^ linkForAssignment ifNil: [
		  linkForAssignment := MetaLink new.
		  linkForAssignment control: #before.
		  linkForAssignment arguments: #( name object newValue ).
		  linkForAssignment metaObject: handler.
		  linkForAssignment selector: #onAssignment:of:value:.
		  ^ linkForAssignment ]
]

{ #category : #private }
ScpInstrumentation >> linkForMessageSend [

	^ linkForMessageSend ifNil: [
		  linkForMessageSend := MetaLink new.
		  linkForMessageSend control: #before.
		  linkForMessageSend arguments: #( selector receiver arguments ).
		  linkForMessageSend metaObject: handler.
		  linkForMessageSend selector: #onMessageSent:to:with:.
		  ^ linkForMessageSend ]
]

{ #category : #private }
ScpInstrumentation >> linkForMethodCall [

	^ linkForMethodCall ifNil: [
		  linkForMethodCall := MetaLink new.
		  linkForMethodCall control: #before.
		  linkForMethodCall arguments: #( selector object sender arguments ).
		  linkForMethodCall metaObject: handler.
		  linkForMethodCall selector: #onMethodCall:of:from:with:.
		  ^ linkForMethodCall ]
]

{ #category : #accessing }
ScpInstrumentation >> methodsToInstrument [

	^ methodsToInstrument
]

{ #category : #parameters }
ScpInstrumentation >> methodsToInstrument: aMethodCollection [

	methodsToInstrument := aMethodCollection
]

{ #category : #services }
ScpInstrumentation >> uninstall [
	
	self methodsToInstrument do: [ :m |
		m classBinding value compiler install: m ast sourceCode.
	].
	ScpInstrumentationRegistry instance removeKey: identifier.	
]
