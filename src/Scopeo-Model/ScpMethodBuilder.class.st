Class {
	#name : 'ScpMethodBuilder',
	#superclass : 'RBProgramNodeVisitor',
	#instVars : [
		'method',
		'sequences',
		'identifer'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'as yet unclassified' }
ScpMethodBuilder class >> isAbstract [

	^ self == RBProgramNodeVisitor
]

{ #category : 'private' }
ScpMethodBuilder >> findVariableNamed: aName [

	(method parameterNamed: aName) ifNotNil: [ :n | ^ n ].
	(sequences top keywordVariableAt: aName) ifNotNil: [ :n | ^ n ].
	(method methodClass attributeNamed: aName) ifNotNil: [ :n | ^ n ].	
	(sequences top temporaryNamed: aName) ifNotNil: [ :n | ^ n ].
	
	self error: 'Trying to read an expression with undefined variables'.
]

{ #category : 'accessing' }
ScpMethodBuilder >> install: aPharoMethod in: aScpClass [

	identifer := 0.
	sequences := Stack new.
	method := ScpMethod new
		methodClass: aScpClass;
		name: aPharoMethod name;
		yourself.
	^ aPharoMethod ast acceptVisitor: self
]

{ #category : 'private' }
ScpMethodBuilder >> nextIdentifier [

	identifer := identifer + 1.
	^ identifer
]

{ #category : 'private' }
ScpMethodBuilder >> visitArgumentNode: anArgumentNode [

	^ anArgumentNode acceptVisitor: self
]

{ #category : 'private' }
ScpMethodBuilder >> visitArgumentNodes: aNodeCollection [

	^ aNodeCollection collect: [ :each | self visitArgumentNode: each ]
]

{ #category : 'private' }
ScpMethodBuilder >> visitArrayNode: anArrayNode [

	^ ScpArray new
		elements: (anArrayNode children collect: [ :each | self visitNode: each ]);
		yourself
]

{ #category : 'private' }
ScpMethodBuilder >> visitAssignmentNode: anAssignmentNode [

	| assignment |	
	
	assignment := ScpAssignment new
		variable: (self visitVariableNode: anAssignmentNode variable);
		expression: (self visitNode: anAssignmentNode value);
		yourself.
		
	anAssignmentNode variable isInstanceVariable ifFalse: [ 
		method expressionAt: self nextIdentifier put: assignment.		
	].

	^ assignment.
]

{ #category : 'private' }
ScpMethodBuilder >> visitBlockNode: aBlockNode [

	^ ScpBlock new
		parameters:( self visitArgumentNodes: aBlockNode arguments);
		body: (self visitNode: aBlockNode body);
		yourself
]

{ #category : 'private' }
ScpMethodBuilder >> visitCascadeNode: aCascadeNode [

	| receiver statements |
	receiver := ScpVariable new
		name: #receiver; 
		yourself.
		
	statements := OrderedCollection new.
	statements add: (ScpAssignment new 
		variable: receiver; 
		expression: (aCascadeNode receiver acceptVisitor: self);
		yourself).

	statements addAll: (aCascadeNode messages collect: [ :m |
		method expressionAt: self nextIdentifier put:(
			ScpMessageSend new
				receiver: (ScpVariableReference new 
					variable: receiver; 
					yourself);
				selector: m selector;
				arguments: (self visitArgumentNodes: m arguments);
				yourself)
	]).

	^ ScpMessageSend new
		receiver: (ScpBlock new
			parameters: ({receiver} asOrderedCollection);
			body: (ScpSequence new 
				statements: statements; 
				yourself
			);
			yourself);
		selector: #value;
		yourself
	
]

{ #category : 'private' }
ScpMethodBuilder >> visitLiteralArrayNode: aRBLiteralArrayNode [

	^ ScpLiteralArray new
		literals: (aRBLiteralArrayNode contents collect: [ :each | self visitLiteralNode: each ]);
		yourself
]

{ #category : 'private' }
ScpMethodBuilder >> visitLiteralNode: aLiteralNode [

	^ ScpLiteralValue new 
		literal: aLiteralNode value;
		yourself
]

{ #category : 'private' }
ScpMethodBuilder >> visitMessageNode: aMessageNode [

	^  method expressionAt: self nextIdentifier put: (ScpMessageSend new
			receiver: (self visitNode: aMessageNode receiver);
			selector: (aMessageNode selectorNode value);
			arguments: (aMessageNode arguments collect: [ :a | a acceptVisitor: self ]);
			yourself)
]

{ #category : 'private' }
ScpMethodBuilder >> visitMethodNode: aMethodNode [
	
	^ method 
		parameters: (self visitVariableDefinitions: aMethodNode arguments);
		body: (self visitNode: aMethodNode body);
		yourself
]

{ #category : 'private' }
ScpMethodBuilder >> visitReturnNode: aReturnNode [

	^  method expressionAt: self nextIdentifier put: (ScpReturn new
			expression: (self visitNode: aReturnNode value);
			yourself)
]

{ #category : 'private' }
ScpMethodBuilder >> visitSequenceNode: aSequenceNode [

	sequences push: ScpSequence new. 
	sequences top method: method.
	sequences top temporaries: (self visitVariableDefinitions: aSequenceNode temporaries).
	sequences top statements: (aSequenceNode statements collect: [ :each | self visitNode: each ]).
	^ sequences pop
]

{ #category : 'private' }
ScpMethodBuilder >> visitVariableDefinition: anVariableNode [

	^ ScpVariable new
		name: anVariableNode name;
		yourself
]

{ #category : 'private' }
ScpMethodBuilder >> visitVariableDefinitions: aVariableCollection [

	^ aVariableCollection collect: [ :v | self visitVariableDefinition: v ]
]

{ #category : 'private' }
ScpMethodBuilder >> visitVariableNode: aVariableNode [
	
	^ ScpVariableReference new
		method: method;
		variable: (self findVariableNamed: aVariableNode name);
		yourself
]
