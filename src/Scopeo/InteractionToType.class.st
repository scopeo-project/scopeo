Class {
	#name : #InteractionToType,
	#superclass : #Predicate,
	#instVars : [
		'class'
	],
	#category : #'Scopeo-Graph-Query'
}

{ #category : #accessing }
InteractionToType >> class: aClass [

	class := aClass
]

{ #category : #'target resize' }
InteractionToType >> satisfies: aGraph [
	
	| graph |
	graph := ObjectGraph new.
	graph addEdges: (aGraph edges select: [ :e | e destination object class = class]).
	^ graph 
]
