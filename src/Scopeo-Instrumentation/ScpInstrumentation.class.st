Class {
	#name : 'ScpInstrumentation',
	#superclass : 'Object',
	#instVars : [
		'packages',
		'methods',
		'indirectionClassName',
		'indirectionClass',
		'identifier'
	],
	#category : 'Scopeo-Instrumentation',
	#package : 'Scopeo-Instrumentation'
}

{ #category : 'private' }
ScpInstrumentation class >> uninstallAll [

	ScpInstrumentationRegistry instance valuesDo: [ :i | 
		i uninstall
	]

]

{ #category : 'parameters' }
ScpInstrumentation >> handler: aHandler [

	ScpInstrumentationRegistry instance at: identifier ifAbsentPut: [ 
		ScpInstrumentationIndirection new
			instrumentation: self;
			yourself	
	].

	(ScpInstrumentationRegistry at: identifier) handler: aHandler



	
]

{ #category : 'private - indirection' }
ScpInstrumentation >> indirectionNode [

	^ RBMessageNode
		  receiver: (RBMessageNode
				   receiver: (RBVariableNode named: #ScpInstrumentationRegistry)
				   selector: #instance)
		  selector: #at:
		  arguments: { (RBLiteralValueNode value: identifier) }
]

{ #category : 'private - indirection' }
ScpInstrumentation >> indirectionOnCallSelector [

	^ (ScpInstrumentationIndirection >> #onCallOf:on:with:) selector
]

{ #category : 'private - indirection' }
ScpInstrumentation >> indirectionOnMessageSelector [

	^ (ScpInstrumentationIndirection >> #onMessage:to:with:) selector
]

{ #category : 'private - indirection' }
ScpInstrumentation >> indirectionOnStateUpdateSelector [

	^ (ScpInstrumentationIndirection >> #onUpdateOf:of:with:) selector
]

{ #category : 'initialization' }
ScpInstrumentation >> initialize [

	identifier := ScpInstrumentationRegistry instance size + 1
]

{ #category : 'services' }
ScpInstrumentation >> install [

	methods do: [ :method | 	
		self instrumentCallOf: method.
		self instrumentMessagesIn: method.
		self instrumentStateUpdatesIn: method.

		method ast doSemanticAnalysis.
		method ast compiler install	
	]
]

{ #category : 'private - instrumentation' }
ScpInstrumentation >> instrumentCallOf: aMethod [

	| instrumentation methodAST |
	
	methodAST := aMethod ast.

	instrumentation := RBMessageNode
		receiver: self indirectionNode
		selector: self indirectionOnCallSelector
		arguments: {
			(RBLiteralValueNode value: methodAST selector) .
			(RBVariableNode named: #self) .
			(RBArrayNode statements: methodAST arguments) 
		}.
	methodAST body addNodeFirst: instrumentation
]

{ #category : 'private - instrumentation' }
ScpInstrumentation >> instrumentMessagesIn: aMethod [

	aMethod ast sendNodes do: [ :node |
		| indirection |
		indirection := RBMessageNode
			receiver: self indirectionNode
			selector: self indirectionOnMessageSelector
			arguments: {
				(RBLiteralValueNode value: node selector).
				node receiver.
				(RBArrayNode statements: node arguments)
			}.
		node parent replaceNode: node withNode: indirection
	 ]
]

{ #category : 'private - instrumentation' }
ScpInstrumentation >> instrumentStateUpdatesIn: aMethod [

	aMethod ast instanceVariableWriteNodes do: [ :node | 
			| assignment indirection |
			assignment := node parent.
			indirection := RBMessageNode
		         receiver: self indirectionNode
		         selector: self indirectionOnStateUpdateSelector
		         arguments: {
						(RBLiteralValueNode value: node name).
		    			(RBVariableNode named: #self).
				     	assignment value 
					}.
			assignment parent replaceNode: assignment withNode: indirection
	].
]

{ #category : 'accessing' }
ScpInstrumentation >> methods: aMethodCollection [

	methods := aMethodCollection
]

{ #category : 'services' }
ScpInstrumentation >> uninstall [

	methods ifNotNil: [ :mtds |
		mtds do: [ :m |
			m classBinding value compiler install: m ast sourceCode.
		].
	].
	ScpInstrumentationRegistry instance removeKey: identifier.	
]
