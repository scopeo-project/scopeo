Class {
	#name : #IsWriteMessage,
	#superclass : #Predicate,
	#category : #'Scopeo-Graph-Query'
}

{ #category : #'target resize' }
IsWriteMessage >> satisfies: aGraph [

	| graph previous edges |
	
	previous := nil.
	edges := OrderedCollection new.
	
	aGraph edges do: [ :e |
		(e action isAssignment and: [ previous isNotNil ] ) ifTrue: [ 
			edges add: previous.
		].
		previous := e.
	].
	
	graph := ObjectGraph new.
	graph addEdges: edges.
	
	^ graph
	
]
