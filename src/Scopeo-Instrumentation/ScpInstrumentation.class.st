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
	#classInstVars : [
		'instrumentedMethods'
	],
	#category : #'Scopeo-Instrumentation'
}

{ #category : #accessing }
ScpInstrumentation class >> addInstrumentedMethod: aMethod [

	(self instrumentedMethodsIncludes: aMethod) ifTrue: [ 
		self error: 'Method ', aMethod name, ' already instrumented'
	].
	self instrumentedMethods add: aMethod name
]

{ #category : #accessing }
ScpInstrumentation class >> instrumentedMethods [

	^ instrumentedMethods ifNil: [ instrumentedMethods := OrderedCollection new ]
]

{ #category : #testing }
ScpInstrumentation class >> instrumentedMethodsIncludes: aMethod [

	^ self instrumentedMethods includes: aMethod name
]

{ #category : #testing }
ScpInstrumentation class >> instrumentedMethodsIncludesAny: aMethodCollection [
	
	^ self instrumentedMethods includesAny: (aMethodCollection collect: [ :m | m name ])
]

{ #category : #removing }
ScpInstrumentation class >> removeInstrumentedMethod: aMethod [

	self instrumentedMethods remove: aMethod name ifAbsent: [ "Do nothing" ]
]

{ #category : #private }
ScpInstrumentation class >> uninstallAll [

	<script: 'self uninstallAll'>
	self allInstancesDo: [ :i | i uninstall ]

]

{ #category : #parameters }
ScpInstrumentation >> handler: aHandler [

	handler := aHandler



	
]

{ #category : #private }
ScpInstrumentation >> indirectionForAssignment [

	^ indirectionForAssignment ifNil: [
		  indirectionForAssignment := ScpAssignmentIndirection new.
		  indirectionForAssignment handler: handler.
		
		ScpInstrumentationRegistry instance
			  at: indirectionForAssignment hash
			  ifAbsentPut: [ indirectionForAssignment ].
		
		  ^ indirectionForAssignment ]
]

{ #category : #private }
ScpInstrumentation >> indirectionForMessageSend [

	^ indirectionForMessageSend ifNil: [
		  indirectionForMessageSend := ScpMessageSendIndirection new.
		  indirectionForMessageSend handler: handler.
		
		ScpInstrumentationRegistry instance
			  at: indirectionForMessageSend hash
			  ifAbsentPut: [ indirectionForMessageSend ].
			
		  ^ indirectionForMessageSend ]
]

{ #category : #private }
ScpInstrumentation >> indirectionForMethodCall [

	^ indirectionForMethodCall ifNil: [
		  indirectionForMethodCall := ScpMethodCallIndirection new.
		  indirectionForMethodCall handler: handler.

		  ScpInstrumentationRegistry instance
			  at: indirectionForMethodCall hash
			  ifAbsentPut: [ indirectionForMethodCall ].

		  ^ indirectionForMethodCall 
	  ]
]

{ #category : #services }
ScpInstrumentation >> install [

	self methodsToInstrument do: [ :method |
		|ast |

		ast := method ast copy.

		self instrumentMessageSends: ast.
		self instrumentMethodCall: ast.
		self instrumentAssignments: ast.
		
		ast := (RBParser parseExpression: ast dump) evaluate.
		
		method methodClass compile: ast formattedCode.
		
		self class addInstrumentedMethod: method.
	]
]

{ #category : #private }
ScpInstrumentation >> instrumentAssignments: aMethodNode [

	aMethodNode instanceVariableWriteNodes do: [ :node |
		self indirectionForAssignment installOn: node parent
	]
]

{ #category : #private }
ScpInstrumentation >> instrumentMessageSends: aMethodNode [

	| nodes |
	nodes := aMethodNode sendNodes.
	nodes := nodes reject: [ :n | n receiver isBlock ].
	nodes do: [ :node |
		self indirectionForMessageSend installOn: node 
	]
]

{ #category : #private }
ScpInstrumentation >> instrumentMethodCall: aMethodNode [

	self indirectionForMethodCall installOn: aMethodNode
]

{ #category : #accessing }
ScpInstrumentation >> methodsToInstrument [

	^ methodsToInstrument
]

{ #category : #parameters }
ScpInstrumentation >> methodsToInstrument: aMethodCollection [

	(self class instrumentedMethodsIncludesAny: aMethodCollection) ifTrue: [
		self error: 'At least one of the methods provided has already been instrumented.'
	].
	methodsToInstrument := aMethodCollection
]

{ #category : #services }
ScpInstrumentation >> uninstall [
	
	self methodsToInstrument ifNotNil: [ :methods | 
		methods do: [ :m | 
			m methodClass addSelector: m selector withMethod: m.
			self class removeInstrumentedMethod: m
		]
	].

	ScpInstrumentationRegistry instance removeKey: self indirectionForAssignment hash ifAbsent: ["nothing"].
	ScpInstrumentationRegistry instance removeKey: self indirectionForMessageSend hash ifAbsent: ["nothing"].
	ScpInstrumentationRegistry instance removeKey: self indirectionForMethodCall hash ifAbsent: ["nothing"].			
]
