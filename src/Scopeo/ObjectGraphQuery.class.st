Class {
	#name : #ObjectGraphQuery,
	#superclass : #Object,
	#instVars : [
		'graph',
		'predicate'
	],
	#category : #'Scopeo-Graph-Query'
}

{ #category : #'instance creation' }
ObjectGraphQuery >> execute [

	predicate ifNil: [ self error: 'Query has no predicate' ].
	
	^ predicate satisfies: graph
]

{ #category : #accessing }
ObjectGraphQuery >> graph: aGraph [

	graph := aGraph
]

{ #category : #accessing }
ObjectGraphQuery >> predicate: aPredicate [

	predicate := aPredicate
]
