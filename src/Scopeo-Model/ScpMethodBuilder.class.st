Class {
	#name : #ScpMethodBuilder,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'indirection',
		'currentMethod',
		'nodeIdentifierSuffix',
		'nodeIdentifierIndex'
	],
	#category : #'Scopeo-Model'
}

{ #category : #'as yet unclassified' }
ScpMethodBuilder class >> isAbstract [

	^ self == RBProgramNodeVisitor
]

{ #category : #accessing }
ScpMethodBuilder >> from: aMethod [

	^ aMethod ast acceptVisitor: self
]

{ #category : #visiting }
ScpMethodBuilder >> visitArgumentNode: anArgumentNode [

	^ anArgumentNode acceptVisitor: self
]

{ #category : #visiting }
ScpMethodBuilder >> visitArgumentNodes: aNodeCollection [


	^ aNodeCollection collect: [ :n | self visitArgumentNode: n ]
]

{ #category : #visiting }
ScpMethodBuilder >> visitArrayNode: anArrayNode [

	^ ScpArray new
		elements: (anArrayNode children collect: [ :each | self visitNode: each ]);
		yourself
]

{ #category : #visiting }
ScpMethodBuilder >> visitAssignmentNode: anAssignmentNode [

	^ ScpAssignment new
		variable: (self visitVariableNode: anAssignmentNode variable);
		expression: (self visitNode: anAssignmentNode value);
		yourself
		
]

{ #category : #visiting }
ScpMethodBuilder >> visitBlockNode: aBlockNode [

	^ ScpBlock new
		parameters:( self visitArgumentNodes: aBlockNode arguments);
		body: (self visitNode: aBlockNode body);
		yourself
]

{ #category : #visiting }
ScpMethodBuilder >> visitCascadeNode: aCascadeNode [

	| receiver sequence |
	receiver := ScpVariable new
		name: #receiver; 
		yourself.
		
	sequence := ScpSequence new.
	sequence addStatement: (ScpAssignment new 
		variable: receiver; 
		expression: (aCascadeNode receiver acceptVisitor: self);
		yourself
	).
	sequence addStatements: (aCascadeNode messages collect: [ :m |
		ScpMessageSend new
			receiver: receiver;
			selector: m selectorNode name;
			arguments: (self visitArgumentNodes: m arguments);
			yourself
	]).

	^ ScpMessageSend new
		receiver: (ScpBlock new
			temporaries: ({receiver} asOrderedCollection);
			body: sequence;
			yourself);
		selector: #value;
		yourself
	
]

{ #category : #visiting }
ScpMethodBuilder >> visitLiteralArrayNode: aRBLiteralArrayNode [

	^ ScpLiteralArray new
		literals: (aRBLiteralArrayNode contents collect: [ :each | self visitLiteralNode: each ]);
		yourself
]

{ #category : #visiting }
ScpMethodBuilder >> visitLiteralNode: aLiteralNode [

	^ ScpLiteralValue new 
		literal: aLiteralNode value;
		yourself
]

{ #category : #visiting }
ScpMethodBuilder >> visitMessageNode: aMessageNode [

	^ ScpMessageSend new
		receiver: (self visitNode: aMessageNode receiver);
		selector: (aMessageNode selectorNode value);
		arguments: (self visitArgumentNodes: aMessageNode arguments);
		yourself
]

{ #category : #visiting }
ScpMethodBuilder >> visitMethodNode: aMethodNode [
	
	^ ScpMethod new 
		name: aMethodNode selector;
		parameters: (self visitArgumentNodes: aMethodNode arguments);
		body: (self visitNode: aMethodNode body);
		yourself
]

{ #category : #visiting }
ScpMethodBuilder >> visitReturnNode: aReturnNode [

	^ ScpReturn new
		expression: (self visitNode: aReturnNode value);
		yourself
]

{ #category : #visiting }
ScpMethodBuilder >> visitSequenceNode: aSequenceNode [

	^ ScpSequence new
		temporaries: (self visitTemporaryNodes: aSequenceNode temporaries);
		statements: (aSequenceNode statements collect: [ :each | self visitNode: each ]);
		yourself
]

{ #category : #visiting }
ScpMethodBuilder >> visitTemporaryNode: aTemporaryNode [

	^ self visitVariableNode: aTemporaryNode
]

{ #category : #visiting }
ScpMethodBuilder >> visitTemporaryNodes: aNodeCollection [

	^ aNodeCollection collect: [ :t | self visitVariableNode: t].
]

{ #category : #visiting }
ScpMethodBuilder >> visitVariableNode: aVariableNode [

	^ ScpVariable new 
		name: aVariableNode name; 
		yourself
]
