Class {
	#name : #ScpBlock,
	#superclass : #ScpExpression,
	#instVars : [
		'parameters',
		'body'
	],
	#category : #'Scopeo-Model'
}

{ #category : #visiting }
ScpBlock >> accept: aVisitor [

	^ aVisitor visitBlock: self
]

{ #category : #adding }
ScpBlock >> addParameter: aVariable [

	parameters add: aVariable
]

{ #category : #accessing }
ScpBlock >> body [

	^ body
]

{ #category : #accessing }
ScpBlock >> body: anObject [

	body := anObject
]

{ #category : #testing }
ScpBlock >> isBlock [

	^ true
]

{ #category : #accessing }
ScpBlock >> parameters [

	^ parameters
]

{ #category : #accessing }
ScpBlock >> parameters: anObject [

	parameters := anObject
]
