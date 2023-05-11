Class {
	#name : #IsInteraction,
	#superclass : #BooleanPredicate,
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #'target resize' }
IsInteraction >> verify: aEvent in: aProgramEvents [
	
	^ aEvent isInteraction
]
