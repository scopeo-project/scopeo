Class {
	#name : #IsInteractionBefore,
	#superclass : #Predicate,
	#instVars : [
		'edge'
	],
	#category : #'Scopeo-Graph-Query'
}

{ #category : #accessing }
IsInteractionBefore class >> edge: aEdge [

	^ self new 
		edge: aEdge;
		yourself
]

{ #category : #accessing }
IsInteractionBefore >> edge: aEdge [

	edge := aEdge.
]

{ #category : #'target resize' }
IsInteractionBefore >> satisfies: aGraph [

	| graph start end |
	graph := ObjectGraph new.	
	end := aGraph edges indexOf: edge ifAbsent: [ ^ graph ].
	start := end > 100 ifTrue: [ end - 100] ifFalse: [ 1 ].
	graph addEdges: (aGraph edges copyFrom: start to: end).
	graph addEdge: edge.
	^ graph
]
