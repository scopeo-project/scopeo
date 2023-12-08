Class {
	#name : 'ScpInstrumentation',
	#superclass : 'Object',
	#instVars : [
		'methods',
		'identifier',
		'indirectionNode',
		'indirectionReceiverNode',
		'indirectionReceiverNodes',
		'linkForExecution',
		'linkForAssignment',
		'linkForInvocation',
		'handler',
		'imageMethods',
		'methodsToInstrument',
		'classesOfMethodsToInstrument',
		'instrumentedMethods',
		'linkForMessageSend'
	],
	#category : 'Scopeo-Instrumentation',
	#package : 'Scopeo-Instrumentation'
}

{ #category : 'private' }
ScpInstrumentation class >> uninstallAll [

	<script: 'self uninstallAll'>
	
	self allInstancesDo: [ :i | i uninstall ]

]

{ #category : 'private' }
ScpInstrumentation >> classesOfMethodsToInstrument [

	^ classesOfMethodsToInstrument ifNil: [  
		| classes |
		classes := self methodsToInstrument flatCollect: [ :m | m methodClass ].
		classesOfMethodsToInstrument := IdentitySet new 
			growTo: classes size;
	 		noCheckNoGrowFillFrom: classes;
			yourself.
	]
]

{ #category : 'parameters' }
ScpInstrumentation >> handler: aHandler [

	handler := aHandler



	
]

{ #category : 'accessing' }
ScpInstrumentation >> imageMethods: aSelector [

	^ imageMethods select: [ :m | m selector = aSelector ]
]

{ #category : 'parameters' }
ScpInstrumentation >> initialize [

	imageMethods := SystemNavigation default allMethodsSelect: [ :b | true ].

]

{ #category : 'services' }
ScpInstrumentation >> install [

	methods do: [ :method |
		self instrumentMethodCall: method.
		self instrumentMessageSends: method.
		self instrumentAssignments: method.
	]
]

{ #category : 'private' }
ScpInstrumentation >> instrumentAssignments: aMethod [

	aMethod ast instanceVariableWriteNodes do: [ :node |
		node linkIfAbsent: self linkForAssignment
	]
]

{ #category : 'private' }
ScpInstrumentation >> instrumentMessageSends: aMethod [

	aMethod ast sendNodes do: [ :node | 
		(self imageMethods: node selector) do: [ :m | 
			m linkIfAbsent: self linkForMessageSend
		]
	].
]

{ #category : 'private' }
ScpInstrumentation >> instrumentMethodCall: aMethod [

	aMethod ast linkIfAbsent: self linkForMethodCall.
]

{ #category : 'private' }
ScpInstrumentation >> linkForAssignment [

	^ linkForAssignment ifNil: [
		  linkForAssignment := MetaLink new.
		  linkForAssignment control: #before.
		  linkForAssignment arguments: #( value variable object).
		  "linkForAssignment optionArgsAsArray: true."
		  linkForAssignment optionCompileOnLinkInstallation: true.
		  linkForAssignment metaObject: handler.
		  linkForAssignment selector: #onAssignmentOf:to:of:.
		  ^ linkForAssignment ]
]

{ #category : 'private' }
ScpInstrumentation >> linkForMessageSend [

	^ linkForMessageSend ifNil: [
		  linkForMessageSend := MetaLink new.
		  linkForMessageSend control: #before.
		  linkForMessageSend arguments: #( method object sender arguments ).
		  "linkForMessageSend optionArgsAsArray: true."
		  linkForMessageSend optionCompileOnLinkInstallation: true.
		  linkForMessageSend metaObject: self.
		  linkForMessageSend selector: #onMessageSend:to:from:with:.
		  ^ linkForMessageSend ]
]

{ #category : 'private' }
ScpInstrumentation >> linkForMethodCall [

	^ linkForExecution ifNil: [
		  linkForExecution := MetaLink new.
		  linkForExecution control: #before.
		  linkForExecution arguments: #( method object sender arguments ).
		  "linkForExecution optionArgsAsArray: true."
		  linkForExecution optionCompileOnLinkInstallation: true.
		  linkForExecution metaObject: handler.
		  linkForExecution selector: #onCallOf:on:from:with:.
		  ^ linkForExecution ]
]

{ #category : 'accessing' }
ScpInstrumentation >> methodsToInstrument [

	^ methodsToInstrument
]

{ #category : 'parameters' }
ScpInstrumentation >> methodsToInstrument: aMethodCollection [

	methodsToInstrument := aMethodCollection
]

{ #category : 'private' }
ScpInstrumentation >> onMessageSend: aMethod to: aReceiver from: aSender with: aArguments [
	
	(self classesOfMethodsToInstrument includes: aSender class) ifFalse: [ ^ self ].
	handler onCallOf: aMethod on: aReceiver from: aSender with: aArguments.
				
]

{ #category : 'services' }
ScpInstrumentation >> uninstall [
	
	self linkForAssignment uninstall.
	self linkForInvocation uninstall.
	self linkForMethodCall uninstall.
]
