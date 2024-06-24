Class {
	#name : #ScpAssignment,
	#superclass : #ScpExpression,
	#instVars : [
		'variable',
		'expression'
	],
	#category : #'Scopeo-Model'
}

{ #category : #visiting }
ScpAssignment >> accept: aVisitor [

	^ aVisitor visitAssignment: self
]

{ #category : #accessing }
ScpAssignment >> expression [

	^ expression
]

{ #category : #accessing }
ScpAssignment >> expression: anExpression [

	expression := anExpression
]

{ #category : #accessing }
ScpAssignment >> variable [

	^ variable
]

{ #category : #accessing }
ScpAssignment >> variable: aVariable [

	variable := aVariable
]
