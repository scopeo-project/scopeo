Class {
	#name : #IsStateAccess,
	#superclass : #Predicate,
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #'target resize' }
IsStateAccess >> verify: aEvent in: aEvents [
	
	^ aEvent isStateAccess
]
