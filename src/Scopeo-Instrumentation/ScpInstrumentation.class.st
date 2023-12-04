Class {
	#name : 'ScpInstrumentation',
	#superclass : 'Object',
	#instVars : [
		'packages',
		'methods',
		'indirectionClassName',
		'indirectionClass',
		'identifier',
		'indirectionNode'
	],
	#category : 'Scopeo-Instrumentation',
	#package : 'Scopeo-Instrumentation'
}

{ #category : 'private' }
ScpInstrumentation class >> uninstallAll [

	ScpInstrumentationRegistry instance valuesDo: [ :i | 
		i instrumentation uninstall
	]

]

{ #category : 'parameters' }
ScpInstrumentation >> handler: aHandler [

	ScpInstrumentationRegistry instance at: identifier ifAbsentPut: [ 
		ScpInstrumentationIndirection new
			instrumentation: self;
			yourself	
	].

	(ScpInstrumentationRegistry instance at: identifier) handler: aHandler



	
]

{ #category : 'as yet unclassified' }
ScpInstrumentation >> indirectionMessageNode: aMessageNode [

	^ RBMessageNode
		  receiver: self indirectionReceiverNode
		  selector:
		  (ScpInstrumentationIndirection >> #onMessage:to:with:) selector
		  arguments: {
				  (RBLiteralValueNode value: aMessageNode selector).
				  aMessageNode receiver.
				  (RBArrayNode statements: aMessageNode arguments) }
]

{ #category : 'as yet unclassified' }
ScpInstrumentation >> indirectionMethodCallNode: aMethodNode [

	^ RBMessageNode
		  receiver: self indirectionReceiverNode
		  selector: (ScpInstrumentationIndirection >> #onCallOf:on:with:) selector
		  arguments: {
				  (RBLiteralValueNode value: aMethodNode selector).
				  (RBVariableNode named: #self).
				  (RBArrayNode statements: aMethodNode arguments) }
]

{ #category : 'private - indirection' }
ScpInstrumentation >> indirectionReceiverNode [

	^ RBMessageNode
		  receiver: (RBMessageNode
				   receiver: (RBVariableNode named: #ScpInstrumentationRegistry)
				   selector: #instance)
		  selector: #at:
		  arguments: { (RBLiteralValueNode value: identifier) }
]

{ #category : 'as yet unclassified' }
ScpInstrumentation >> indirectionStateUpdateNode: anAssignmentNode [

	^ RBMessageNode
		  receiver: self indirectionReceiverNode
		  selector:
		  (ScpInstrumentationIndirection >> #onUpdateOf:of:with:) selector
		  arguments: {
				  (RBLiteralValueNode value: anAssignmentNode name).
				  (RBVariableNode named: #self).
				  anAssignmentNode parent value }
]

{ #category : 'initialization' }
ScpInstrumentation >> initialize [

	identifier := ScpInstrumentationRegistry instance size + 1
]

{ #category : 'services' }
ScpInstrumentation >> install [

	methods do: [ :method | 	
		self instrumentMethodCallOf: method.
		self instrumentMessagesIn: method.
		self instrumentStateUpdatesIn: method.

		method ast doSemanticAnalysis.
		method ast compiler install	
	]
]

{ #category : 'private - instrumentation' }
ScpInstrumentation >> instrumentMessagesIn: aMethod [

	| nodes |

	nodes := aMethod ast sendNodes.
	nodes := nodes reject: [ :node | node receiver = self indirectionReceiverNode ].
	nodes := nodes reject: [ :node | node receiver = self superNode ].
	nodes do: [ :node |
		node parent
			replaceNode: node
			withNode: (self indirectionMessageNode: node)
	]
]

{ #category : 'private - instrumentation' }
ScpInstrumentation >> instrumentMethodCallOf: aMethod [

	| methodNode |
	methodNode := aMethod ast.
	methodNode body addNodeFirst: (self indirectionMethodCallNode: methodNode).
]

{ #category : 'private - instrumentation' }
ScpInstrumentation >> instrumentStateUpdatesIn: aMethod [

	aMethod ast instanceVariableWriteNodes do: [ :node |
		| assignment |
		assignment := node parent.
		assignment parent
			replaceNode: assignment
			withNode: (self indirectionStateUpdateNode: node)
	]
]

{ #category : 'accessing' }
ScpInstrumentation >> methods: aMethodCollection [

	methods := aMethodCollection
]

{ #category : 'private - indirection' }
ScpInstrumentation >> superNode [

	^ RBVariableNode named: #super
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
