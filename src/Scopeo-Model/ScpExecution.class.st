Class {
	#name : 'ScpExecution',
	#superclass : 'Object',
	#instVars : [
		'timestamp',
		'events',
		'messagesReceived',
		'messagesSent',
		'messagesReceivedDict',
		'messagesSentDict',
		'stateUpdatesDict'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'instance creation' }
ScpExecution class >> fromTracesArray: aTracesArray [

	| mappers execution iterator |
	
	execution := self new.
	
	mappers := ScpTraceToObjectEventMapper subclasses collect: [ :s |
		s key -> s new.
	] as: Dictionary.

	iterator := ScpTraceArrayIterator new 
		array: aTracesArray; 
		yourself.

	[ iterator hasNext ] whileTrue: [ 
		(mappers at: iterator next) from: iterator to: execution.
	].

	^  execution
]

{ #category : 'parameters' }
ScpExecution >> addEvent: anObjectEvent [

	events ifNotEmpty: [
		anObjectEvent previous: events top.
		events top next: anObjectEvent 
	]. 
	events push: anObjectEvent
]

{ #category : 'parameters' }
ScpExecution >> addMessageReceived: aMessageReceived [

	messagesReceived push: aMessageReceived.
	
	self addEvent: aMessageReceived.
	
	messagesReceivedDict at: aMessageReceived object 
		ifPresent: [ :c | c add: aMessageReceived ]
		ifAbsentPut: [ 
			OrderedCollection new 
				add: aMessageReceived; 
				yourself 
		]
	

]

{ #category : 'parameters' }
ScpExecution >> addMessageReturn: aReturnValue [

	messagesSent pop return: aReturnValue
]

{ #category : 'parameters' }
ScpExecution >> addMessageSent: aMessageSentEvent [

	messagesSent push: aMessageSentEvent.
	
	self addEvent: aMessageSentEvent.
	
	messagesSentDict at: aMessageSentEvent object 
		ifPresent: [ :c | c add: aMessageSentEvent ]
		ifAbsentPut: [ 
			OrderedCollection new 
				add: aMessageSentEvent; 
				yourself 
		]
]

{ #category : 'parameters' }
ScpExecution >> addMethodReturn: aReturnValue [

	messagesReceived pop return: aReturnValue
]

{ #category : 'parameters' }
ScpExecution >> addStateUpdated: aStateUpdated [

	self addEvent: aStateUpdated.
	
	stateUpdatesDict at: aStateUpdated object 
		ifPresent: [ :c | c add: aStateUpdated ]
		ifAbsentPut: [ 
			OrderedCollection new 
				add: aStateUpdated; 
				yourself
		]
]

{ #category : 'services' }
ScpExecution >> events [

	^ events
]

{ #category : 'initialization' }
ScpExecution >> initialize [

	events := Stack new.
	
	messagesReceived := Stack new.
	messagesSent := Stack new.
	
	messagesReceivedDict := IdentityDictionary new.
	messagesSentDict := IdentityDictionary new.
	stateUpdatesDict := IdentityDictionary new
]

{ #category : 'services' }
ScpExecution >> messagesReceivedBy: anObject [

	^ messagesReceived at: anObject ifAbsent: [ OrderedCollection empty ]
]

{ #category : 'services' }
ScpExecution >> messagesSentBy: anObject [

	^ messagesSent at: anObject ifAbsent: [ OrderedCollection empty ]
]

{ #category : 'services' }
ScpExecution >> stateUpdatesOf: anObject [

	^ stateUpdatesDict at: anObject ifAbsent: [ OrderedCollection empty ]
]
