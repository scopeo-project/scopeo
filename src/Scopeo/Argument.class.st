Class {
	#name : #Argument,
	#superclass : #InteractionPredicate,
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #'target resize' }
Argument >> verify: aEvent in: aProgramEvents [
	
	^ aEvent isInteraction and: [ aEvent arguments includesAnyOf: values ]
]
