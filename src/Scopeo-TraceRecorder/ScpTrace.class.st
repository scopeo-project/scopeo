Class {
	#name : #ScpTrace,
	#superclass : #Object,
	#instVars : [
		'id'
	],
	#category : 'Scopeo-TraceRecorder-Model'
}

{ #category : #testing }
ScpTrace class >> isAbstract [

	^ self == ScpTrace
]

{ #category : #accessing }
ScpTrace >> id [

	^ id
]

{ #category : #accessing }
ScpTrace >> id: anIdentifier [

	id := anIdentifier
]

{ #category : #testing }
ScpTrace >> isAssignment [

	^ false
]

{ #category : #testing }
ScpTrace >> isMessageSend [

	^ false
]

{ #category : #testing }
ScpTrace >> isMethodCall [

	^ false
]

{ #category : #printing }
ScpTrace >> printOn: aStream [

	aStream << self asString
]
