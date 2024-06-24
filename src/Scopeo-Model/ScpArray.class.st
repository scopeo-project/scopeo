Class {
	#name : #ScpArray,
	#superclass : #ScpExpression,
	#instVars : [
		'elements'
	],
	#category : #'Scopeo-Model'
}

{ #category : #visiting }
ScpArray >> accept: aVisitor [

	^ aVisitor visitArray: self
]

{ #category : #accessing }
ScpArray >> elements [

	^ elements
]

{ #category : #accessing }
ScpArray >> elements: anObject [

	elements := anObject
]
