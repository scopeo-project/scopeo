Class {
	#name : #And,
	#superclass : #BinaryBooleanPredicate,
	#category : #'Scopeo-Graph-Query'
}

{ #category : #'target resize' }
And >> verify: aEdge in: aGraph [
	
	^ (left verify: aEdge in: aGraph) and: [ right verify: aEdge in: aGraph ]
]
