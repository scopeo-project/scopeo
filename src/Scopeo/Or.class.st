Class {
	#name : #Or,
	#superclass : #ScpBinaryBooleanPredicate,
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #'target resize' }
Or >> verify: aEvent scope: aScope events: aProgramEvents [

	^ (left verify: aEvent scope: aScope events: aProgramEvents) or: [
		  right verify: aEvent scope: aScope events: aProgramEvents ]
]
