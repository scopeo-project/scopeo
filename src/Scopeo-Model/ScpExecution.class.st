Class {
	#name : 'ScpExecution',
	#superclass : 'Object',
	#instVars : [
		'system',
		'firstEvent',
		'lastEvent',
		'calls',
		'events',
		'timestamp'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'private - adding events' }
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

{ #category : 'private - adding events' }
ScpExecution >> addMessageEvent: aSelector sender: aSender receiver: aReceiver arguments: anArguments node: aNodeId [

	| call |
	
	call := ScpMethodCall new
		timestamp: self timestamp;
		previous: self previousEvent;
		object: (system addPharoObject: aReceiver);
		method: (system addPharoMethod: (ScpTraceSourceSelectionRegistry instance method: aSelector of: aReceiver class));
		source: (calls top method expressionAt: aNodeId);
		yourself.
		
	call arguments: ((1 to: anArguments size) collect: [ :i | 
		ScpBindedVariable new
			variable: (call method parameters at: i);
			value: (system addPharoObject: (anArguments at: i));
			yourself
	]).
	self nextEvent: call.
	calls push: call.
]

{ #category : 'private - adding events' }
ScpExecution >> addMethodEvent: aSelector sender: aSender receiver: aReceiver arguments: anArguments [
	
	| call |

	self flag: #todo.
	"TODO: 
		- Change the way we retrieve the original method.
		- make sure that when the method is modified the method selections get updated too.
	"
	call := ScpExternalMethodCall new
		timestamp: self timestamp;
		previous: self previousEvent;
		sender: (system addPharoObject: aSender);
		object: (system addPharoObject: aReceiver);
		method: (system addPharoMethod: (ScpTraceSourceSelectionRegistry instance method: aSelector of: aReceiver class)); 
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

{ #category : 'private - adding events' }
ScpExecution >> addReturnEvent: aValue node: aNodeId [ 

	| call |
	call := calls pop.
	call return: (ScpMethodReturn new
		timestamp: self timestamp;
		previous: self previousEvent;
		source: (call method expressionAt: aNodeId);
		object: (system addPharoObject: aValue);
		yourself)
	
	

]

{ #category : 'private - adding events' }
ScpExecution >> addSuperEvent: aSelector sender: aSender arguments: anArguments node: aNodeId [

	| call |

	call := ScpSuperMethodCall new
		timestamp: self timestamp;
		previous: self previousEvent;
		object: (system addPharoObject: aSender);
		method: (system addPharoMethod: (ScpTraceSourceSelectionRegistry instance method: aSelector of: aSender class));
		source: (calls top method expressionAt: aNodeId);
		yourself.
		
	call arguments: ((1 to: anArguments size) collect: [ :i | 
		ScpBindedVariable new
			variable: (call method arguments at: i);
			value: (system addPharoObject: (anArguments at: i));
			yourself
	]).
	self nextEvent: call.
	calls push: call.
]

{ #category : 'accessing' }
ScpExecution >> events [

	^ events
]

{ #category : 'accessing' }
ScpExecution >> firstEvent [

	^ events first
]

{ #category : 'initialization' }
ScpExecution >> initialize [

	timestamp := 0.
	system := ScpSystem new.
	events := Stack new.
	calls := Stack new
]

{ #category : 'accessing' }
ScpExecution >> lastEvent [

	^ lastEvent last
]

{ #category : 'private - adding events' }
ScpExecution >> nextEvent: anEvent [

	self previousEvent ifNotNil: [ :e |
		 e next: anEvent 
	].
	events push: anEvent.
]

{ #category : 'private - adding events' }
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

{ #category : 'private - adding events' }
ScpExecution >> timestamp [

	timestamp := timestamp + 1.
	^ timestamp
]
