Class {
	#name : #And,
	#superclass : #BinaryBooleanPredicate,
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #'target resize' }
And >> verify: aEdge in: aEvents [
	
	^ (left verify: aEdge in: aEvents) and: [ right verify: aEdge in: aEvents ]
]
