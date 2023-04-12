Class {
	#name : #ObjectGraph,
	#superclass : #Object,
	#instVars : [
		'vertices',
		'edges'
	],
	#category : #'Scopeo-Graph'
}

{ #category : #visiting }
ObjectGraph >> accept: aVisitor [
	
	aVisitor visitGraph: self
]

{ #category : #adding }
ObjectGraph >> addEdge: aEdge [
	
	(edges includes: aEdge) ifFalse: [ edges add: aEdge ]. 
	edges sort: [ :a :b | a index < b index ].
	
	self addVertex: aEdge origin.
	self addVertex: aEdge destination
]

{ #category : #adding }
ObjectGraph >> addEdges: aEdges [
	
	aEdges do: [ :e | self addEdge: e ]
]

{ #category : #accessing }
ObjectGraph >> addVertex: aVertex [

	vertices at: aVertex objectOid ifAbsentPut: [ aVertex ].
]

{ #category : #accessing }
ObjectGraph >> edges [

	^ edges
]

{ #category : #accessing }
ObjectGraph >> edges: anObject [

	edges := anObject
]

{ #category : #initialization }
ObjectGraph >> initialize [

	vertices := Dictionary new.
	edges := OrderedCollection new
]

{ #category : #'target resize' }
ObjectGraph >> subgraph: aPredicate [

	^ self class new
		addEdges: (edges select: [ :e | aPredicate verify: e in: self]);
		yourself.
]

{ #category : #accessing }
ObjectGraph >> vertices [

	^ vertices
]
