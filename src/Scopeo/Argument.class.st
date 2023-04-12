Class {
	#name : #Argument,
	#superclass : #Predicate,
	#instVars : [
		'value'
	],
	#category : #'Scopeo-Graph-Query'
}

{ #category : #accessing }
Argument class >> value: aObject [
	^ self new 
		value: aObject;
		yourself
]

{ #category : #accessing }
Argument >> value: aObject [

	value := aObject
]

{ #category : #'target resize' }
Argument >> verify: aEdge in: aGraph [
	
	^ aEdge action isMessage and: [ aEdge action arguments includes: value ]
]
