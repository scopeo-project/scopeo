Class {
	#name : #Selector,
	#superclass : #Predicate,
	#instVars : [
		'selector',
		'selectors'
	],
	#category : #'Scopeo-Graph-Query'
}

{ #category : #'instance creation' }
Selector class >> selector: aSelector [

	^ self new 
		selector: aSelector;
		yourself
]

{ #category : #'instance creation' }
Selector class >> symbol: aSymbol [

	^ self new 
		selector: aSymbol;
		yourself
]

{ #category : #accessing }
Selector >> selector: aSelector [

	selectors := { aSelector }
]

{ #category : #accessing }
Selector >> selectors: aSelectorArray [

	selectors := aSelectorArray
]

{ #category : #'target resize' }
Selector >> verify: aEdge in: aGraph [
	
	^ aEdge action isMessage and: [ selectors includes: aEdge action selector ]
]
