Class {
	#name : #And,
	#superclass : #BinaryBooleanPredicate,
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #'target resize' }
And >> verify: aEvent scope: aScope events: aProgramEvents [

	^ (left verify: aEvent scope: nil events: aProgramEvents) and: [
		  right verify: aEvent scope: nil events: aProgramEvents ]
]
