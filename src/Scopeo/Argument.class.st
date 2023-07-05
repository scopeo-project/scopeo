Class {
	#name : #Argument,
	#superclass : #ScpInteractionPredicate,
	#category : #'Scopeo-Predicates'
}

{ #category : #'target resize' }
Argument >> verify: aEvent scope: aScope events: aProgramEvents [
	
	^ aEvent isInteraction and: [ aEvent arguments includesAnyOf: values ]
]
