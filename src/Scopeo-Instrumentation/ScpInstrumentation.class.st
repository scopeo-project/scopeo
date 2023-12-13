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
		'indirectionReceiverNode',
		'indirectionForAssignment',
		'indirectionForMessageSend',
		'indirectionForMethodCall'
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

{ #category : #private }
ScpInstrumentation >> indirectionForAssignment [

	^ indirectionForAssignment ifNil: [ 
		  indirectionForAssignment := ScpAssignmentIndirection new.
		  "indirectionForAssignment for: node parent;"
		  indirectionForAssignment handler: handler.
		  indirectionForAssignment beBeforeNodeExecution.
		  indirectionForAssignment selector: #onAssignment:of:value:.
		  "indirectionForAssignment arguments: { self nodeForString: node name . self selfNode . node parent value }."
		  ^ indirectionForAssignment ]
]

{ #category : #private }
ScpInstrumentation >> indirectionForMessageSend [

	^ indirectionForMessageSend ifNil: [ 
		  indirectionForMessageSend := ScpMessageSendIndirection new.
		  indirectionForMessageSend handler: handler.
		  indirectionForMessageSend beBeforeNodeExecution.
		  indirectionForMessageSend selector: #onMessageSent:to:with:.
		  "indirectionForMessageSend arguments: { self nodeForSymbol: node selector . node receiver . self nodeForArray: node arguments }."
		  ^ indirectionForMessageSend ]
]

{ #category : #private }
ScpInstrumentation >> indirectionForMethodCall [

	^ indirectionForMethodCall ifNil: [ 
		  indirectionForMethodCall := ScpMethodCallIndirection new.
		  indirectionForMethodCall handler: handler.
		  indirectionForMethodCall beBeforeNodeExecution.
		  indirectionForMethodCall selector: #onMethodCall:of:from:with:.
		  "indirectionForMethodCall arguments: { self nodeForSymbol: node selector . node receiver . self nodeForArray: node arguments };"
		  ^ indirectionForMethodCall ]
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
		self instrumentMethodCall: method.
		self instrumentMessageSends: method.
		self instrumentAssignments: method.
	]
]

{ #category : #private }
ScpInstrumentation >> instrumentAssignments: aMethod [

	aMethod ast instanceVariableWriteNodes do: [ :node | 
		self indirectionForAssignment 
			for: node parent;
			arguments: { 
				self nodeForLiteral: node name
				. self nodeSelf
				. node parent value 
			};
			install 
	]
]

{ #category : #private }
ScpInstrumentation >> instrumentMessageSends: aMethod [
	
	| nodes |
	
	nodes := aMethod ast sendNodes.
	nodes := nodes reject: [ :n | n receiver isBlock ].
	nodes do: [ :node |
		self indirectionForMessageSend  
			for: node;
			arguments: { 
				self nodeForLiteral: node selector asSymbol 
				. node receiver 
				. self nodeForArray: node arguments 
			};
			install
	]
]

{ #category : #private }
ScpInstrumentation >> instrumentMethodCall: aMethod [

	| node |
	node := aMethod ast.
	self indirectionForMethodCall
		for: node;
		arguments: { 
			self nodeForLiteral: node selector 
			. self nodeSelf 
			. self nodeFor: 'thisContext receiver' 
			. self nodeForArray: node arguments
		};
		install
]

{ #category : #accessing }
ScpInstrumentation >> methodsToInstrument [

	^ methodsToInstrument
]

{ #category : #parameters }
ScpInstrumentation >> methodsToInstrument: aMethodCollection [

	methodsToInstrument := aMethodCollection
]

{ #category : #helpers }
ScpInstrumentation >> nodeFor: anExpression [

	^ RBParser parseExpression: anExpression
]

{ #category : #helpers }
ScpInstrumentation >> nodeForArray: anArray [

	^ RBArrayNode statements: anArray
]

{ #category : #helpers }
ScpInstrumentation >> nodeForLiteral: aString [

	^ RBLiteralValueNode value: aString
]

{ #category : #'instance creation' }
ScpInstrumentation >> nodeSelf [

	^ RBParser parseExpression: 'self'
]

{ #category : #services }
ScpInstrumentation >> uninstall [
	
	self methodsToInstrument do: [ :m |
		m classBinding value compiler install: m ast sourceCode.
	].
	ScpInstrumentationRegistry instance removeKey: identifier.	
]
