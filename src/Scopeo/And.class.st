Class {
	#name : #And,
	#superclass : #BinaryPredicate,
	#category : #'Scopeo-Graph-Query'
}

{ #category : #'target resize' }
And >> verify: aEdge in: aGraph [
	
	^ (left verify: aEdge in: aGraph) and: [ left verify: aEdge in: aGraph ]
]
