Class {
	#name : #IsStateUpdate,
	#superclass : #BooleanPredicate,
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #'target resize' }
IsStateUpdate >> verify: aEvent scope: aScope events: aProgramEvents [
	
	^ aEvent isStateEvent and: [ aEvent isStateUpdate ]
]
