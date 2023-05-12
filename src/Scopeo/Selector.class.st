Class {
	#name : #Selector,
	#superclass : #InteractionPredicate,
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #'target resize' }
Selector >> verify: aEvent scope: aScope events: aProgramEvents [

	^ aEvent isInteraction and: [ values includes: aEvent selector ]
]
