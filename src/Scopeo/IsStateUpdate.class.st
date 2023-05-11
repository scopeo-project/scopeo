Class {
	#name : #IsStateUpdate,
	#superclass : #BooleanPredicate,
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #'target resize' }
IsStateUpdate >> verify: aEvent in: aProgramEvents [
	
	^ aEvent isStateEvent and: [ aEvent isStateUpdate ]
]
