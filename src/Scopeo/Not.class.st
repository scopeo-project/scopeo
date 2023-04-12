Class {
	#name : #Not,
	#superclass : #BooleanPredicate,
	#instVars : [
		'predicate'
	],
	#category : #'Scopeo-Graph-Query'
}

{ #category : #accessing }
Not class >> predicate: aPredicate [
	
	^ self new
		predicate: aPredicate;
		yourself
]

{ #category : #accessing }
Not >> predicate: aPredicate [

	predicate := aPredicate
]

{ #category : #'target resize' }
Not >> verify: aEdge in: aGraph [
	
	^ (predicate verify: aEdge in: aGraph) not
]
