Class {
	#name : #ScpLiteralValue,
	#superclass : #ScpLiteral,
	#instVars : [
		'literal'
	],
	#category : #'Scopeo-Model'
}

{ #category : #visiting }
ScpLiteralValue >> accept: aVisitor [

	^ aVisitor visitLiteralValue: self
]

{ #category : #accessing }
ScpLiteralValue >> literal [

	^ literal
]

{ #category : #accessing }
ScpLiteralValue >> literal: anObject [

	literal := anObject
]
