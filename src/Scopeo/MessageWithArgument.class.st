Class {
	#name : #MessageWithArgument,
	#superclass : #Predicate,
	#instVars : [
		'value'
	],
	#category : #'Scopeo-Graph-Query'
}

{ #category : #accessing }
MessageWithArgument class >> value: aObject [
	^ self new 
		value: aObject;
		yourself
]

{ #category : #'target resize' }
MessageWithArgument >> satisfies: aGraph [

	| graph |
	graph := ObjectGraph new.
	graph addEdges: (aGraph edges select: [ :e | 
		e action isMessage and: [ e action arguments includes: value ]
	]).
	^ graph
]

{ #category : #accessing }
MessageWithArgument >> value: aObject [

	value := aObject
]
