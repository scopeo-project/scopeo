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
ScpExecution >> addExternalMethodCall: anExternalMethodCallTrace [
	| call |

	self flag: #todo.
	"TODO: 
		- Change the way we retrieve the original method.
		- make sure that when the method is modified the method selections get updated too.
	"
	call := ScpExternalMethodCall new
		timestamp: self timestamp;
		previous: self previousEvent;
		sender: (system addPharoObject: anExternalMethodCallTrace sender);
		object: (system addPharoObject: anExternalMethodCallTrace receiver);
		method: (system addPharoMethod: (ScpTraceSourceSelectionRegistry instance method: anExternalMethodCallTrace selector of: anExternalMethodCallTrace receiver class)); 
		yourself. 
	call arguments: ((1 to: anExternalMethodCallTrace arguments size) collect: [ :i | 
		ScpBindedVariable new
			variable: (call method parameters at: i);
			value: (system addPharoObject: (anExternalMethodCallTrace arguments at: i));
			yourself
	]).

	self nextEvent: call.
	calls push: call

]

{ #category : 'private - adding events' }
ScpExecution >> addMethodCall: aMethodCallTrace [
	| call |
	
	call := ScpMethodCall new
		timestamp: self timestamp;
		previous: self previousEvent;
		object: (system addPharoObject: aMethodCallTrace receiver);
		method: (system addPharoMethod: (ScpTraceSourceSelectionRegistry instance method: aMethodCallTrace selector of: aMethodCallTrace receiver class));
		source: (calls top method expressionAt: aMethodCallTrace node);
		yourself.
		
	call arguments: ((1 to: aMethodCallTrace arguments size) collect: [ :i | 
		ScpBindedVariable new
			variable: (call method parameters at: i);
			value: (system addPharoObject: (aMethodCallTrace arguments at: i));
			yourself
	]).
	self nextEvent: call.
	calls push: call.
]

{ #category : 'private - adding events' }
ScpExecution >> addMethodReturn: aMethodReturnTrace [

	| call |
	call := calls pop.
	call return: (ScpMethodReturn new
		timestamp: self timestamp;
		previous: self previousEvent;
		source: (call method expressionAt: aMethodReturnTrace node);
		object: (system addPharoObject: aMethodReturnTrace value);
		yourself)
	
	

]

{ #category : 'private - adding events' }
ScpExecution >> addStateUpdate: aStateUpdateTrace [
	| value |

	value := ScpBindedVariable new 
		variable: ((system addPharoObject: aStateUpdateTrace object) objectClass attributeNamed: aStateUpdateTrace variable);
		value: (system addPharoObject: aStateUpdateTrace value);
		yourself.
		
	self nextEvent: (ScpStateUpdate new
		timestamp: self timestamp;
		previous: self previousEvent;
		object: (system addPharoObject: aStateUpdateTrace object);
		source: (	calls top method expressionAt: aStateUpdateTrace node);
		value: value;
		yourself).
]

{ #category : 'private - adding events' }
ScpExecution >> addSuperMethodCall: aSuperMethodCallTrace [
	| call |

	call := ScpSuperMethodCall new
		timestamp: self timestamp;
		previous: self previousEvent;
		object: (system addPharoObject: aSuperMethodCallTrace sender);
		method: (system addPharoMethod: (ScpTraceSourceSelectionRegistry instance method: aSuperMethodCallTrace selector of: aSuperMethodCallTrace sender class));
		source: (calls top method expressionAt: aSuperMethodCallTrace node );
		yourself.
		
	call arguments: ((1 to: aSuperMethodCallTrace arguments size) collect: [ :i | 
		ScpBindedVariable new
			variable: (call method arguments at: i);
			value: (system addPharoObject: (aSuperMethodCallTrace arguments at: i));
			yourself
	]).
	self nextEvent: call.
	calls push: call.
]

{ #category : 'adding' }
ScpExecution >> addTrace: aScpTrace [

	aScpTrace addToExecution: self
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
