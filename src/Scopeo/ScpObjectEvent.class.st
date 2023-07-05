Class {
	#name : #ScpObjectEvent,
	#superclass : #Object,
	#instVars : [
		'timeTravelIndex',
		'method'
	],
	#category : #'Scopeo-Model'
}

{ #category : #testing }
ScpObjectEvent class >> isAbstract [
		
	^ self == ScpObjectEvent
]

{ #category : #testing }
ScpObjectEvent >> isInteraction [

	^ false
]

{ #category : #testing }
ScpObjectEvent >> isStateEvent [

	^ false
]

{ #category : #accessing }
ScpObjectEvent >> method [

^ method
]

{ #category : #accessing }
ScpObjectEvent >> method: aMethod [

	method := aMethod 
]

{ #category : #accessing }
ScpObjectEvent >> timeTravelIndex [

	^ timeTravelIndex
]

{ #category : #accessing }
ScpObjectEvent >> timeTravelIndex: anObject [

	timeTravelIndex := anObject
]
