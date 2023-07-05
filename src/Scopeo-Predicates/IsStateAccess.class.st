Class {
	#name : #IsStateAccess,
	#superclass : #ScpBooleanPredicate,
	#category : #'Scopeo-Predicates'
}

{ #category : #'target resize' }
IsStateAccess >> verify: aEvent scope: aScope events: aProgramEvents [
	
	^ aEvent isStateEvent and: [ aEvent isStateAccess ]
]
