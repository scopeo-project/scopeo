Class {
	#name : #Or,
	#superclass : #BinaryPredicate,
	#category : #'Scopeo-Graph-Query'
}

{ #category : #'target resize' }
Or >> verify: aEdge in: aGraph [
	
	^ (left verify: aEdge in: aGraph) or: [ right verify: aEdge in: aGraph ]
]
