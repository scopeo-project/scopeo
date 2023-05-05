Class {
	#name : #Selector,
	#superclass : #InteractionPredicate,
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #'target resize' }
Selector >> verify: aEvent in: aProgramEvents [

	^ aEvent isInteraction and: [ values includes: aEvent selector ]
]
