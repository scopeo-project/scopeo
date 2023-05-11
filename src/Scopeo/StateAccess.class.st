Class {
	#name : #StateAccess,
	#superclass : #StateEvent,
	#category : #'Scopeo-ObjectsEventsModel'
}

{ #category : #testing }
StateAccess >> isStateAccess [

	^ true
]

{ #category : #printing }
StateAccess >> printOn: aStream [

	aStream 
		<< object asString 
		<< '(' << objectId asString << ')' 
		<< ' read variable "' << variable name asString
		<< '" in method "' << method name asString << '"'
]
