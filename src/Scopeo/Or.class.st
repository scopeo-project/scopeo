Class {
	#name : #Or,
	#superclass : #BinaryBooleanPredicate,
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #'target resize' }
Or >> verify: aEvent in: aProgramEvents [
	
	^ (left verify: aEvent in: aProgramEvents) or: [ right verify: aEvent in: aProgramEvents ]
]
