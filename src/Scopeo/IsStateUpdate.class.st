Class {
	#name : #IsStateUpdate,
	#superclass : #Predicate,
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #'target resize' }
IsStateUpdate >> verify: aEvent in: aEvents [
	
	^ aEvent isStateUpdate
]
