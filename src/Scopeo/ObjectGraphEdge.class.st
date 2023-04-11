Class {
	#name : #ObjectGraphEdge,
	#superclass : #ObjectGraphVisitable,
	#instVars : [
		'origin',
		'action',
		'destination',
		'index'
	],
	#category : #'Scopeo-Graph'
}

{ #category : #visiting }
ObjectGraphEdge >> accept: aVisitor [
	
	aVisitor visitEdge: self
]

{ #category : #accessing }
ObjectGraphEdge >> action [

	^ action
]

{ #category : #accessing }
ObjectGraphEdge >> action: anObject [

	action := anObject
]

{ #category : #accessing }
ObjectGraphEdge >> destination [

	^ destination
]

{ #category : #accessing }
ObjectGraphEdge >> destination: anObject [

	destination := anObject
]

{ #category : #accessing }
ObjectGraphEdge >> index [

	^ index
]

{ #category : #accessing }
ObjectGraphEdge >> index: aIndex [

	index := aIndex
]

{ #category : #accessing }
ObjectGraphEdge >> origin [

	^ origin
]

{ #category : #accessing }
ObjectGraphEdge >> origin: anObject [

	origin := anObject
]

{ #category : #printing }
ObjectGraphEdge >> printOn: aStream [

	aStream << origin asString << '[' << action asString << ']' << destination asString
]
