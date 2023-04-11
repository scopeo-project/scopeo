Class {
	#name : #UseSelector,
	#superclass : #Predicate,
	#instVars : [
		'selector',
		'selectors'
	],
	#category : #'Scopeo-Graph-Query'
}

{ #category : #'instance creation' }
UseSelector class >> selector: aSelector [

	^ self new 
		selector: aSelector;
		yourself
]

{ #category : #'target resize' }
UseSelector >> satisfies: aGraph [
	
	| graph |
	graph := ObjectGraph new.
	graph addEdges: (aGraph edges select: [ :e |
		e action isMessage and: [ selectors includes: e action selector ]
	]).
	^ graph
]

{ #category : #accessing }
UseSelector >> selector: aSelector [

	selectors := { aSelector }
]

{ #category : #accessing }
UseSelector >> selectors: aSelectorArray [

	selectors := aSelectorArray
]
