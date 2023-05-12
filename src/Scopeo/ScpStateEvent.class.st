Class {
	#name : #ScpStateEvent,
	#superclass : #ScpObjectEvent,
	#instVars : [
		'object',
		'objectId',
		'method',
		'variable'
	],
	#category : #'Scopeo-ObjectsEventsModel'
}

{ #category : #testing }
ScpStateEvent class >> isAbstract [

	^ self == ScpStateEvent
]

{ #category : #testing }
ScpStateEvent >> isStateAccess [

	^ false
]

{ #category : #testing }
ScpStateEvent >> isStateEvent [

	^ true
]

{ #category : #testing }
ScpStateEvent >> isStateUpdate [

	^ false
]

{ #category : #accessing }
ScpStateEvent >> method [

	^ method
]

{ #category : #accessing }
ScpStateEvent >> method: anObject [

	method := anObject
]

{ #category : #accessing }
ScpStateEvent >> object [

	^ object
]

{ #category : #accessing }
ScpStateEvent >> object: anObject [

	object := anObject
]

{ #category : #accessing }
ScpStateEvent >> variable [

	^ variable
]

{ #category : #accessing }
ScpStateEvent >> variable: anObject [

	variable := anObject
]
