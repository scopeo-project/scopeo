Class {
	#name : #IsAssignment,
	#superclass : #Predicate,
	#category : #'Scopeo-Graph-Query'
}

{ #category : #'target resize' }
IsAssignment >> satisfies: aGraph [

	| graph |
	graph := ObjectGraph new.		
	graph addEdges: (aGraph edges select: [ 
		:e | e action isAssignment 
	]).		
	^ graph
	
]
