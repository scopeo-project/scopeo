Class {
	#name : #ScpScope,
	#superclass : #Object,
	#instVars : [
		'objects',
		'events'
	],
	#category : #'Scopeo-Model'
}

{ #category : #accessing }
ScpScope >> events [

	^ events
]

{ #category : #initialization }
ScpScope >> initialize [

	objects := ScpScopeObjects new.
	events := ScpScopeEvents new.
]

{ #category : #accessing }
ScpScope >> objects [

	^ objects
]
