Class {
	#name : #IsWrite,
	#superclass : #Predicate,
	#category : #'Scopeo-Graph-Query'
}

{ #category : #'target resize' }
IsWrite >> verify: aEdge in: aGraph [
	
	^ (aGraph edges at: (aGraph edges indexOf: aEdge) + 1) isAssignment
]
