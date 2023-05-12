Class {
	#name : #Argument,
	#superclass : #InteractionPredicate,
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #'target resize' }
Argument >> verify: aEvent scope: aScope events: aProgramEvents [
	
	^ aEvent isInteraction and: [ aEvent arguments includesAnyOf: values ]
]
