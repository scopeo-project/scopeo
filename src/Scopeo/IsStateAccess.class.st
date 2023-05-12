Class {
	#name : #IsStateAccess,
	#superclass : #BooleanPredicate,
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #'target resize' }
IsStateAccess >> verify: aEvent scope: aScope events: aProgramEvents [
	
	^ aEvent isStateEvent and: [ aEvent isStateAccess ]
]
