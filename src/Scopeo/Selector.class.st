Class {
	#name : #Selector,
	#superclass : #InteractionPredicate,
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #'target resize' }
Selector >> verify: aEvent in: aProgramEvents [

	^ aEvent isInteraction and: [ values includes: aEvent selector ]
]
