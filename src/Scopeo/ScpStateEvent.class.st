Class {
	#name : #ScpStateEvent,
	#superclass : #ScpObjectEvent,
	#instVars : [
		'object',
		'objectId',
		'variable'
	],
	#category : #'Scopeo-Entities'
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
