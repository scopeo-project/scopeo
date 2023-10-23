Class {
	#name : #ScpScopeEvents,
	#superclass : #Object,
	#instVars : [
		'events'
	],
	#category : #'Scopeo-Model'
}

{ #category : #accessing }
ScpScopeEvents >> at: aLabel [

	events at: aLabel
]

{ #category : #services }
ScpScopeEvents >> at: aLabel putAll: aScpEventCollection [

	events
		at: aLabel
		ifPresent: [ :items | items addAll: aScpEventCollection ]
		ifAbsentPut: [ aScpEventCollection asOrderedCollection ].
]

{ #category : #initialization }
ScpScopeEvents >> initialize [

	events := Dictionary new.
]

{ #category : #accessing }
ScpScopeEvents >> keys [

	^ events keys
]

{ #category : #services }
ScpScopeEvents >> remove: aLabel [

	events removeKey: aLabel
]
