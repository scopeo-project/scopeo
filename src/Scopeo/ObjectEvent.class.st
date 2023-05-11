Class {
	#name : #ObjectEvent,
	#superclass : #Object,
	#instVars : [
		'bytecodeIndex',
		'pc'
	],
	#category : #'Scopeo-ObjectsEventsModel'
}

{ #category : #testing }
ObjectEvent class >> isAbstract [
		
	^ self == ObjectEvent
]

{ #category : #accessing }
ObjectEvent >> bytecodeIndex [

	^ bytecodeIndex
]

{ #category : #accessing }
ObjectEvent >> bytecodeIndex: aBytecodeIndex [

	bytecodeIndex := aBytecodeIndex
]

{ #category : #testing }
ObjectEvent >> isInteraction [

	^ false
]

{ #category : #testing }
ObjectEvent >> isStateEvent [

	^ false
]
