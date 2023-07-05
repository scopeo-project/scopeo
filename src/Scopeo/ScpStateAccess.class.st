Class {
	#name : #ScpStateAccess,
	#superclass : #ScpStateEvent,
	#category : #'Scopeo-Model'
}

{ #category : #testing }
ScpStateAccess >> isStateAccess [

	^ true
]

{ #category : #printing }
ScpStateAccess >> printOn: aStream [

	aStream 
		<< object asString 
		<< ' read variable "' << variable name asString
		<< '" in method "' << method name asString << '"'
]
