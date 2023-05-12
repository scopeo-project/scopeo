Class {
	#name : #IsStateUpdate,
	#superclass : #ScpBooleanPredicate,
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #'target resize' }
IsStateUpdate >> verify: aEvent scope: aScope events: aProgramEvents [
	
	^ aEvent isStateEvent and: [ aEvent isStateUpdate ]
]
