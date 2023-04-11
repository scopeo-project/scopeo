Class {
	#name : #And,
	#superclass : #BinaryPredicate,
	#category : #'Scopeo-Graph-Query'
}

{ #category : #'target resize' }
And >> satisfies: aGraph [

	^ right satisfies: (left satisfies: aGraph)
]
