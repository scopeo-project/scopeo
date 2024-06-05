Class {
	#name : #ScpAssignment,
	#superclass : #ScpExpression,
	#instVars : [
		'variable',
		'expression'
	],
	#category : 'Scopeo-Model'
}

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
