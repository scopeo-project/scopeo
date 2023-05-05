Class {
	#name : #IsStateUpdate,
	#superclass : #BooleanPredicate,
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #'target resize' }
IsStateUpdate >> verify: aEvent in: aProgramEvents [
	
	^ aEvent isStateEvent and: [ aEvent isStateUpdate ]
]
