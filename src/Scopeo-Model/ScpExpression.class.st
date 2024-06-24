Class {
	#name : #ScpExpression,
	#superclass : #ScpExecutionElement,
	#instVars : [
		'identifier',
		'method'
	],
	#category : #'Scopeo-Model'
}

{ #category : #visiting }
ScpExpression >> accept: aVisitor [

	self subclassResponsibility
]

{ #category : #accessing }
ScpExpression >> identifier [

	^ identifier
]

{ #category : #accessing }
ScpExpression >> identifier: anObject [

	identifier := anObject
]

{ #category : #testing }
ScpExpression >> isBlock [

	^ false
]

{ #category : #testing }
ScpExpression >> isLiteral [

	^ false
]

{ #category : #accessing }
ScpExpression >> method [

	^ method
]

{ #category : #accessing }
ScpExpression >> method: anObject [

	method := anObject
]
