Class {
	#name : 'ScpDataStorage',
	#superclass : 'Object',
	#instVars : [
		'events'
	],
	#category : 'Scopeo-Data',
	#package : 'Scopeo-Data'
}

{ #category : 'events' }
ScpDataStorage >> addMessage: aScpMessage [
	"A message has been sent by an object during the execution of the program."

	events add: aScpMessage
]

{ #category : 'events' }
ScpDataStorage >> addStateUpdate: aScpStateUpdate [
	"A new value has been assigned to an object instance variable."

	events add: aScpStateUpdate
]

{ #category : 'services' }
ScpDataStorage >> clear [

	events removeAll
]

{ #category : 'services' }
ScpDataStorage >> fetch: aScpPredicate [

	^ events select: [ :e | aScpPredicate verify: e ]
]

{ #category : 'initialization' }
ScpDataStorage >> initialize [

	events := OrderedCollection new
]
