Class {
	#name : #ScpDataStorage,
	#superclass : #Object,
	#traits : 'ScpDataObserver',
	#classTraits : 'ScpDataObserver classTrait',
	#instVars : [
		'events'
	],
	#category : #'Scopeo-Data'
}

{ #category : #services }
ScpDataStorage >> clear [

	events removeAll
]

{ #category : #services }
ScpDataStorage >> fetch: aScpPredicate [

	^ events select: [ :e | aScpPredicate verify: e ]
]

{ #category : #initialization }
ScpDataStorage >> initialize [

	events := OrderedCollection new
]

{ #category : #events }
ScpDataStorage >> onMessage: aScpMessage [
	"A message has been sent by an object during the execution of the program."

	events add: aScpMessage
]

{ #category : #events }
ScpDataStorage >> onStateUpdate: aScpStateUpdate [
	"A new value has been assigned to an object instance variable."

	events add: aScpStateUpdate
]
