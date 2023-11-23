Class {
	#name : 'ScpInstrumentation',
	#superclass : 'Object',
	#instVars : [
		'packages',
		'methods',
		'handler',
		'indirectionClassName',
		'indirectionClass'
	],
	#category : 'Scopeo-Instrumentation',
	#package : 'Scopeo-Instrumentation'
}

{ #category : 'private' }
ScpInstrumentation class >> uninstallAll [

	self allInstancesDo: [ :i | i uninstall ]
]

{ #category : 'parameters' }
ScpInstrumentation >> handler: aHandler [

	| indice classname |
	indice := self indirections size + 1.
	classname := ScpInstrumentationIndirection name , 'X' , indice asString.

	ScpInstrumentationIndirection duplicateClassWithNewName: classname.
		
	self indirectionClass: (self class environment at: classname).
	self indirectionClass create 
		instrumentation: self;
		handler: aHandler.
]

{ #category : 'private - indirection' }
ScpInstrumentation >> indirectionClass [

	^ indirectionClass
]

{ #category : 'private - indirection' }
ScpInstrumentation >> indirectionClass: anIndirectionClass [

	indirectionClass := anIndirectionClass
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

{ #category : 'private - indirection' }
ScpInstrumentation >> indirections [

	^ ScpAbstractIndirection subclasses reject: [ :c | c = ScpInstrumentationIndirection ].
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
		receiver: self newIndirectionNode
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
			receiver: self newIndirectionNode
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
		         receiver: self newIndirectionNode
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

{ #category : 'private - indirection' }
ScpInstrumentation >> newIndirectionNode [

	^ RBMessageNode
			 receiver: (RBVariableNode named: self indirectionClass name)
			 selector: #instance.
]

{ #category : 'parameters' }
ScpInstrumentation >> packages: aPackageNameCollection [

	methods := self packagesMethods: (aPackageNameCollection collect: [ :n | n asPackage ])
]

{ #category : 'private - filtering' }
ScpInstrumentation >> packagesMethods: aPackages [

	| classes |
	classes := aPackages flatCollect: [ :p | p classes ].
	^ (classes flatCollect: #methods) select: [ :m |
		  (aPackages includes: m methodClass package) or: [
			  aPackages anySatisfy: [ :p | m protocol name match: p name ] ] ]
]

{ #category : 'services' }
ScpInstrumentation >> uninstall [

	methods do: [ :m |
		m classBinding value compiler install: m ast sourceCode.
	].
	indirectionClass ifNotNil: [ :c | c removeFromSystem ]
	
]
