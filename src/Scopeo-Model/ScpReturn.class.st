Class {
	#name : #ScpReturn,
	#superclass : #ScpExpression,
	#instVars : [
		'expression'
	],
	#category : #'Scopeo-Model'
}

{ #category : #visiting }
ScpReturn >> accept: aVisitor [

	^ aVisitor visitReturn: self
]

{ #category : #accessing }
ScpReturn >> expression [

	^ expression
]

{ #category : #accessing }
ScpReturn >> expression: anObject [

	expression := anObject
]
