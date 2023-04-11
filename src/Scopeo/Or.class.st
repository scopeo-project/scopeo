Class {
	#name : #Or,
	#superclass : #BinaryPredicate,
	#category : #'Scopeo-Graph-Query'
}

{ #category : #'target resize' }
Or >> satisfies: aGraph [

	| graph |
	graph := ObjectGraph new.
	graph addEdges: (left satisfies: aGraph) edges.
	graph addEdges: (right satisfies: aGraph) edges.
	^ graph
]
