Class {
	#name : #ScpStateUpdate,
	#superclass : #ScpStateEvent,
	#instVars : [
		'oldValue',
		'newValue'
	],
	#category : #'Scopeo-Model'
}

{ #category : #testing }
ScpStateUpdate >> isStateUpdate [

	^ true
]

{ #category : #accessing }
ScpStateUpdate >> newValue [

	^ newValue
]

{ #category : #accessing }
ScpStateUpdate >> newValue: anObject [

	newValue := anObject
]

{ #category : #accessing }
ScpStateUpdate >> oldValue [

	^ oldValue
]

{ #category : #accessing }
ScpStateUpdate >> oldValue: anObject [

	oldValue := anObject
]

{ #category : #printing }
ScpStateUpdate >> printOn: aStream [

	aStream 
		<< object asString
		<< ' wrote "' << newValue asString
		<< '" to variable "' << variable name asString 
		<< '(' << oldValue asString << ')"'
]
