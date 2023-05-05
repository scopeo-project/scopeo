Class {
	#name : #OccuredBefore,
	#superclass : #EventPredicate,
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #'target resize' }
OccuredBefore >> verify: aEvent in: aProgramEvents [

	limit < 1 ifTrue: [ ^ false ].
	limit := limit - 1.
	
	^ aEvent bytecodeIndex < event bytecodeIndex
]
