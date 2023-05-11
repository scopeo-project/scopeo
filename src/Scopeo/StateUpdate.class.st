Class {
	#name : #StateUpdate,
	#superclass : #StateEvent,
	#instVars : [
		'oldValue',
		'newValue'
	],
	#category : #'Scopeo-ObjectsEventsModel'
}

{ #category : #testing }
StateUpdate >> isStateUpdate [

	^ true
]

{ #category : #accessing }
StateUpdate >> newValue [

	^ newValue
]

{ #category : #accessing }
StateUpdate >> newValue: anObject [

	newValue := anObject
]

{ #category : #accessing }
StateUpdate >> oldValue [

	^ oldValue
]

{ #category : #accessing }
StateUpdate >> oldValue: anObject [

	oldValue := anObject
]

{ #category : #printing }
StateUpdate >> printOn: aStream [

	aStream 
		<< object asString 
		<< '(' << objectId asString << ')' 
		<< ' wrote "' << newValue asString
		<< '" to variable "' << variable name asString 
		<< '(' << oldValue asString << ')"'
]
