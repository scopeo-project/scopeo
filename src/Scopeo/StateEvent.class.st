Class {
	#name : #StateEvent,
	#superclass : #ObjectEvent,
	#instVars : [
		'object',
		'objectId',
		'method',
		'variable'
	],
	#category : #'Scopeo-ObjectsEventsModel'
}

{ #category : #testing }
StateEvent class >> isAbstract [

	^ self == StateEvent
]

{ #category : #testing }
StateEvent >> isStateAccess [

	^ false
]

{ #category : #testing }
StateEvent >> isStateEvent [

	^ true
]

{ #category : #testing }
StateEvent >> isStateUpdate [

	^ false
]

{ #category : #accessing }
StateEvent >> method [

	^ method
]

{ #category : #accessing }
StateEvent >> method: anObject [

	method := anObject
]

{ #category : #accessing }
StateEvent >> object [

	^ object
]

{ #category : #accessing }
StateEvent >> object: anObject [

	object := anObject
]

{ #category : #accessing }
StateEvent >> objectId [

	^ objectId
]

{ #category : #accessing }
StateEvent >> objectId: anObject [

	objectId := anObject
]

{ #category : #accessing }
StateEvent >> variable [

	^ variable
]

{ #category : #accessing }
StateEvent >> variable: anObject [

	variable := anObject
]
