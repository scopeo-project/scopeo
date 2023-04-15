Class {
	#name : #Or,
	#superclass : #BinaryBooleanPredicate,
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #'target resize' }
Or >> verify: aEdge in: aEvents [
	
	^ (left verify: aEdge in: aEvents) or: [ right verify: aEdge in: aEvents ]
]
