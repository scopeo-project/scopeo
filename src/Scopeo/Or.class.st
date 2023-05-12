Class {
	#name : #Or,
	#superclass : #BinaryBooleanPredicate,
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #'target resize' }
Or >> verify: aEvent scope: aScope events: aProgramEvents [

	^ (left verify: aEvent scope: nil events: aProgramEvents) or: [
		  right verify: aEvent scope: nil events: aProgramEvents ]
]
