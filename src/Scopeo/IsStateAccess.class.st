Class {
	#name : #IsStateAccess,
	#superclass : #BooleanPredicate,
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #'target resize' }
IsStateAccess >> verify: aEvent in: aProgramEvents [
	
	^ aEvent isStateEvent and: [ aEvent isStateAccess ]
]
