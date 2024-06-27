Class {
	#name : 'ScpExecution',
	#superclass : 'Object',
	#instVars : [
		'system',
		'firstEvent',
		'lastEvent',
		'calls',
		'events'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'adding events' }
ScpExecution >> addAssignmentEvent: aVariable object: anObject value: aValue node: aNodeId [

	| value |

	value := ScpBindedVariable new 
		variable: ((system addPharoObject: anObject) objectClass attributeNamed: aVariable);
		value: (system addPharoObject: aValue);
		yourself.
		
	self nextEvent: (ScpStateUpdate new
		timestamp: self timestamp;
		previous: self previousEvent;
		object: (system addPharoObject: anObject);
		source: (	calls top method expressionAt: aNodeId);
		value: value;
		yourself).
]

{ #category : 'adding events' }
ScpExecution >> addMessageEvent: aSelector sender: aSender receiver: aReceiver arguments: anArguments node: aNodeId [

	| call expression |
	
	expression := ScpMessageSend new identifier: aNodeId; yourself.
	calls top method addCoveredExpression: expression.
	
	call := ScpMethodCall new
		timestamp: self timestamp;
		previous: self previousEvent;
		object: (self addPharoObject: aReceiver);
		method: (self addMethod: aSelector class: aReceiver class);
		source: expression;
		yourself.
		
	call arguments: ((1 to: anArguments size) collect: [ :i | 
		ScpBindedVariable new
			variable: (call method parameters at: i);
			value: (self addObject: (anArguments at: i));
			yourself
	]).
	self nextEvent: call.
	calls push: call.
]

{ #category : 'adding events' }
ScpExecution >> addMethodEvent: aSelector sender: aSender receiver: aReceiver arguments: anArguments [
	
	| call |

	call := ScpExternalMethodCall new
		timestamp: self timestamp;
		previous: self previousEvent;
		sender: (system addPharoObject: aSender);
		object: (system addPharoObject: aReceiver);
		method: (system addPharoMethod: aReceiver class >> aSelector);
		yourself. 
	call arguments: ((1 to: anArguments size) collect: [ :i | 
		ScpBindedVariable new
			variable: (call method parameters at: i);
			value: (system addPharoObject: (anArguments at: i));
			yourself
	]).

	self nextEvent: call.
	calls push: call

]

{ #category : 'adding events' }
ScpExecution >> addReturnEvent: aValue node: aNodeId [ 

	calls pop return: (self addObject: aValue)
]

{ #category : 'adding events' }
ScpExecution >> addSuperEvent: aSelector sender: aSender arguments: anArguments node: aNodeId [

	| call expression |

	expression := ScpMessageSend new identifier: aNodeId; yourself.
	calls top method addCoveredExpression: expression.
	
	call := ScpSuperMethodCall new
		timestamp: self timestamp;
		previous: self previousEvent;
		object: (self addObject: aSender);
		method: (self addMethod: aSelector class: aSender class);
		source: expression;
		yourself.
		
	call arguments: ((1 to: anArguments size) collect: [ :i | 
		ScpBindedVariable new
			variable: (call method arguments at: i);
			value: (self addObject: (anArguments at: i));
			yourself
	]).
	self nextEvent: call.
	calls push: call.
]

{ #category : 'accessing' }
ScpExecution >> firstEvent [

	^ firstEvent
]

{ #category : 'initialization' }
ScpExecution >> initialize [

	system := ScpSystem new
]

{ #category : 'accessing' }
ScpExecution >> lastEvent [

	^ lastEvent
]

{ #category : 'private' }
ScpExecution >> nextEvent: anEvent [

	self previousEvent ifNotNil: [ :e |
		 e next: anEvent 
	].
	events push: anEvent.
]

{ #category : 'private' }
ScpExecution >> previousEvent [

	events ifEmpty: [ ^ nil ].
	^ events top.
]

{ #category : 'accessing' }
ScpExecution >> system [

	^ system
]

{ #category : 'accessing' }
ScpExecution >> system: aSystem [

	system := aSystem
]

{ #category : 'private' }
ScpExecution >> timestamp [

	timestamp := timestamp + 1.
	^ timestamp
]
