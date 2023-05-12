Class {
	#name : #IsInteraction,
	#superclass : #ScpBooleanPredicate,
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #'target resize' }
IsInteraction >> verify: aEvent scope: aScope events: aProgramEvents [
	
	^ aEvent isInteraction
]
