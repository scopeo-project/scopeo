Class {
	#name : #Selector,
	#superclass : #ScpInteractionPredicate,
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #'target resize' }
Selector >> verify: aEvent scope: aScope events: aProgramEvents [

	^ aEvent isInteraction and: [ values includes: aEvent selector ]
]
