Class {
	#name : #IsAssignment,
	#superclass : #Predicate,
	#category : #'Scopeo-Graph-Query'
}

{ #category : #'target resize' }
IsAssignment >> verify: aEdge in: aGraph [

	^ aEdge action isAssignment
]
