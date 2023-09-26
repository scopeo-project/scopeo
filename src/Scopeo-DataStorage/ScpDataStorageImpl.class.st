Class {
	#name : #ScpDataStorageImpl,
	#superclass : #MolAbstractComponentImpl,
	#traits : 'ScpDataStorage + ScpDataBufferEvents',
	#classTraits : 'ScpDataStorage classTrait + ScpDataBufferEvents classTrait',
	#instVars : [
		'events'
	],
	#category : #'Scopeo-DataStorage'
}

{ #category : #events }
ScpDataStorageImpl >> componentActivate [

	self getScpDataBufferEventsSubscriber subscribe: self
]

{ #category : #events }
ScpDataStorageImpl >> componentPassivate [

	self getScpDataBufferEventsSubscriber unsubscribe: self
]

{ #category : #'component accessing' }
ScpDataStorageImpl >> getScpDataBufferEventsSubscriber [
	| eventsSymbol eventsSubscriber itf |
	itf := ScpDataBufferEvents.
	eventsSymbol := self eventsSubscribers at: itf ifAbsent: [^MolNotFoundEventsSubscriber new interface: itf name: nil].
	eventsSymbol isCollection
	 	ifTrue: 
			[eventsSubscriber := MolComponentManager default locatorServices 
						searchEventsSubscriberFor: ScpDataBufferEvents named: eventsSymbol ]. 
	^eventsSubscriber
]

{ #category : #initialization }
ScpDataStorageImpl >> initialize [

	events := OrderedCollection new
]

{ #category : #events }
ScpDataStorageImpl >> instanceVariableAssigned: anScpScannedAssigment [
	"A new value has been assigned to an object instance variable."
	
	events add: anScpScannedAssigment.
	
	"[ anScpScannedAssigment printString crTrace ]
		on: Error
		do: [ 'error' crTrace ]"
]

{ #category : #events }
ScpDataStorageImpl >> messageSent: anScpScannedMessage [
	"A message has been sent by an object during the execution of the program."

	events add: anScpScannedMessage.
	"[ aMessage printString crTrace ]
		on: Error
		do: [ 'error' crTrace ]"

	
]
