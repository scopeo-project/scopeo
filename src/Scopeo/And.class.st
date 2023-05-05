Class {
	#name : #And,
	#superclass : #BinaryBooleanPredicate,
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #'target resize' }
And >> verify: aEvent in: aProgramEvents [
	
	^ (left verify: aEvent in: aProgramEvents) and: [ right verify: aEvent in: aProgramEvents ]
]
