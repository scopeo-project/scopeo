Class {
	#name : #ObjectGraphVertex,
	#superclass : #ObjectGraphVisitable,
	#instVars : [
		'objectOid',
		'object'
	],
	#category : #'Scopeo-Graph'
}

{ #category : #visiting }
ObjectGraphVertex >> accept: aVisitor [
	
	aVisitor visitVertex: self
]

{ #category : #accessing }
ObjectGraphVertex >> object [

	^ object
]

{ #category : #accessing }
ObjectGraphVertex >> object: anObject [

	object := anObject
]

{ #category : #accessing }
ObjectGraphVertex >> objectOid [

	^ objectOid
]

{ #category : #accessing }
ObjectGraphVertex >> objectOid: anObject [

	objectOid := anObject
]

{ #category : #printing }
ObjectGraphVertex >> printOn: aStream [

	aStream << object className << '(' << objectOid asString << ')'
]
