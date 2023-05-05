Class {
	#name : #IsInteraction,
	#superclass : #BooleanPredicate,
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #'target resize' }
IsInteraction >> verify: aEvent in: aProgramEvents [
	
	^ aEvent isInteraction
]
