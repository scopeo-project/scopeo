Class {
	#name : #Type,
	#superclass : #Predicate,
	#instVars : [
		'type'
	],
	#category : #'Scopeo-Graph-Query'
}

{ #category : #'instance creation' }
Type class >> of: aType [

	^ self new 
		type: aType; 
		yourself
]

{ #category : #accessing }
Type >> type: aType [

	type := aType 
]

{ #category : #'target resize' }
Type >> verify: aEdge in: aGraph [
	
	^ aEdge destination object class = type
]
