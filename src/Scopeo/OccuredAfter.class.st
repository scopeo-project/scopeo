Class {
	#name : #OccuredAfter,
	#superclass : #EventPredicate,
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #'target resize' }
OccuredAfter >> verify: aEvent in: aProgramEvents [

	limit < 1 ifTrue: [ ^ false ].
	limit := limit - 1.
	
	^ aEvent bytecodeIndex > event bytecodeIndex
]
