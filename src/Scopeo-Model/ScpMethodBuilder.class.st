Class {
	#name : 'ScpMethodBuilder',
	#superclass : 'RBProgramNodeVisitor',
	#instVars : [
		'method',
		'sequences'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'as yet unclassified' }
ScpMethodBuilder class >> isAbstract [

	^ self == RBProgramNodeVisitor
]

{ #category : 'visiting' }
ScpMethodBuilder >> findVariableNamed: aName [

	(method parameterNamed: aName) ifNotNil: [ :n | ^ n ].
	(sequences top keywordVariableAt: aName) ifNotNil: [ :n | ^ n ].
	(method methodClass attributeNamed: aName) ifNotNil: [ :n | ^ n ].	
	(sequences top temporaryNamed: aName) ifNotNil: [ :n | ^ n ].
	
	self error: 'Trying to read an expression with undefined variables'.
]

{ #category : 'accessing' }
ScpMethodBuilder >> install: aPharoMethod in: aScpClass [

	sequences := Stack new.
	method := ScpMethod new
		methodClass: aScpClass;
		name: aPharoMethod name;
		yourself.
	^ aPharoMethod ast acceptVisitor: self
]

{ #category : 'visiting' }
ScpMethodBuilder >> visitArrayNode: anArrayNode [

	^ ScpArray new
		elements: (anArrayNode children collect: [ :each | self visitNode: each ]);
		yourself
]

{ #category : 'visiting' }
ScpMethodBuilder >> visitAssignmentNode: anAssignmentNode [

	^ ScpAssignment new
		variable: (self visitVariableNode: anAssignmentNode variable);
		expression: (self visitNode: anAssignmentNode value);
		yourself
		
]

{ #category : 'visiting' }
ScpMethodBuilder >> visitBlockNode: aBlockNode [

	^ ScpBlock new
		parameters:( self visitArgumentNodes: aBlockNode arguments);
		body: (self visitNode: aBlockNode body);
		yourself
]

{ #category : 'visiting' }
ScpMethodBuilder >> visitCascadeNode: aCascadeNode [

	| receiver statements |
	receiver := ScpVariable new
		name: #receiver; 
		yourself.
		
	statements := OrderedCollection new.
	statements add: (ScpAssignment new 
		variable: receiver; 
		expression: (aCascadeNode receiver acceptVisitor: self);
		yourself
	).
	statements addAll: (aCascadeNode messages collect: [ :m |
		ScpMessageSend new
			receiver: receiver;
			selector: m selectorNode name;
			arguments: (self visitArgumentNodes: m arguments);
			yourself
	]).

	^ ScpMessageSend new
		receiver: (ScpBlock new
			temporaries: ({receiver} asOrderedCollection);
			body: (ScpSequence new 
				statements: statements; 
				yourself
			);
			yourself);
		selector: #value;
		yourself
	
]

{ #category : 'visiting' }
ScpMethodBuilder >> visitLiteralArrayNode: aRBLiteralArrayNode [

	^ ScpLiteralArray new
		literals: (aRBLiteralArrayNode contents collect: [ :each | self visitLiteralNode: each ]);
		yourself
]

{ #category : 'visiting' }
ScpMethodBuilder >> visitLiteralNode: aLiteralNode [

	^ ScpLiteralValue new 
		literal: aLiteralNode value;
		yourself
]

{ #category : 'visiting' }
ScpMethodBuilder >> visitMessageNode: aMessageNode [

	^ ScpMessageSend new
		receiver: (self visitNode: aMessageNode receiver);
		selector: (aMessageNode selectorNode value);
		arguments: (aMessageNode arguments collect: [ :a | a acceptVisitor: self ]);
		yourself
]

{ #category : 'visiting' }
ScpMethodBuilder >> visitMethodNode: aMethodNode [
	
	^ method 
		parameters: (self visitVariableDefinitions: aMethodNode arguments);
		body: (self visitNode: aMethodNode body);
		yourself
]

{ #category : 'visiting' }
ScpMethodBuilder >> visitReturnNode: aReturnNode [

	^ ScpReturn new
		expression: (self visitNode: aReturnNode value);
		yourself
]

{ #category : 'visiting' }
ScpMethodBuilder >> visitSequenceNode: aSequenceNode [

	sequences push: ScpSequence new. 
	sequences top method: method.
	sequences top temporaries: (self visitVariableDefinitions: aSequenceNode temporaries).
	sequences top statements: (aSequenceNode statements collect: [ :each | self visitNode: each ]).
	^ sequences pop
]

{ #category : 'visiting' }
ScpMethodBuilder >> visitVariableDefinition: anVariableNode [

	^ ScpVariable new
		name: anVariableNode name;
		yourself
]

{ #category : 'visiting' }
ScpMethodBuilder >> visitVariableDefinitions: aVariableCollection [

	^ aVariableCollection collect: [ :v | self visitVariableDefinition: v ]
]

{ #category : 'visiting' }
ScpMethodBuilder >> visitVariableNode: aVariableNode [
	
	^ ScpVariableReference new
		method: method;
		variable: (self findVariableNamed: aVariableNode name);
		yourself
]
