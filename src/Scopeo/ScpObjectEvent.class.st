Class {
	#name : #ScpObjectEvent,
	#superclass : #Object,
	#instVars : [
		'bytecodeIndex',
		'pc'
	],
	#category : #'Scopeo-ObjectsEventsModel'
}

{ #category : #testing }
ScpObjectEvent class >> isAbstract [
		
	^ self == ScpObjectEvent
]

{ #category : #accessing }
ScpObjectEvent >> bytecodeIndex [

	^ bytecodeIndex
]

{ #category : #accessing }
ScpObjectEvent >> bytecodeIndex: aBytecodeIndex [

	bytecodeIndex := aBytecodeIndex
]

{ #category : #testing }
ScpObjectEvent >> isInteraction [

	^ false
]

{ #category : #testing }
ScpObjectEvent >> isStateEvent [

	^ false
]
