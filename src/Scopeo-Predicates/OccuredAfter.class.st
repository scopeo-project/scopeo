Class {
	#name : #OccuredAfter,
	#superclass : #ScpEventPredicate,
	#category : #'Scopeo-Predicates'
}

{ #category : #'target resize' }
OccuredAfter >> verify: aEvent scope: aScope events: aProgramEvents [

	| event |
	event := aScope getEvent: eventName.

	aEvent bytecodeIndex ifNil: [ ^ false ].
	event bytecodeIndex ifNil: [ ^ false ].
	
	limit < 1 ifTrue: [ ^ false ].
	limit := limit - 1.

	^ aEvent bytecodeIndex > event bytecodeIndex
]
