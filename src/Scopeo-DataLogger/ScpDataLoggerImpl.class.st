Class {
	#name : #ScpDataLoggerImpl,
	#superclass : #MolAbstractComponentImpl,
	#traits : 'ScpDataLogger + ScpDataBufferEvents',
	#classTraits : 'ScpDataLogger classTrait + ScpDataBufferEvents classTrait',
	#category : #'Scopeo-DataLogger'
}

{ #category : #'life cycle' }
ScpDataLoggerImpl >> componentActivate [

	self getScpDataBufferEventsSubscriber subscribe: self
]

{ #category : #'life cycle' }
ScpDataLoggerImpl >> componentPassivate [

	self getScpDataBufferEventsSubscriber unsubscribe: self
]

{ #category : #'component accessing' }
ScpDataLoggerImpl >> getScpDataBufferEventsSubscriber [
	| eventsSymbol eventsSubscriber itf |
	itf := ScpDataBufferEvents.
	eventsSymbol := self eventsSubscribers at: itf ifAbsent: [^MolNotFoundEventsSubscriber new interface: itf name: nil].
	eventsSymbol isCollection
	 	ifTrue: 
			[eventsSubscriber := MolComponentManager default locatorServices 
						searchEventsSubscriberFor: ScpDataBufferEvents named: eventsSymbol ]. 
	^eventsSubscriber
]

{ #category : #events }
ScpDataLoggerImpl >> instanceVariableAssigned: anScpScannedAssigment [
	"A new value has been assigned to an object instance variable."

	[ anScpScannedAssigment printString crTrace ]
		on: Error
		do: [ :e | e crTrace ]
]

{ #category : #events }
ScpDataLoggerImpl >> messageSent: aMessage [
	"A message has been sent by an object during the execution of the program."

	[ aMessage printString crTrace ]
		on: Error
		do: [ :e | e crTrace ]
]

{ #category : #events }
ScpDataLoggerImpl >> scanFinished [
	"The program scanning has been finished."

	'Scopeo - scanning a new program execution' crTrace
]

{ #category : #events }
ScpDataLoggerImpl >> scanStarted [
	"A program scanning has been started."

	'Scopeo - program execution scanning finished' crTrace
]
