Class {
	#name : #OccuredBefore,
	#superclass : #EventPredicate,
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #'target resize' }
OccuredBefore >> verify: aEvent in: aProgramEvents [

	limit < 1 ifTrue: [ ^ false ].
	limit := limit - 1.
	
	^ aEvent bytecodeIndex < event bytecodeIndex
]
