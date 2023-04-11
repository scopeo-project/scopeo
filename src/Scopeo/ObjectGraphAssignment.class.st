Class {
	#name : #ObjectGraphAssignment,
	#superclass : #ObjectGraphAction,
	#instVars : [
		'variable',
		'oldValue',
		'newValue'
	],
	#category : #'Scopeo-Graph'
}

{ #category : #testing }
ObjectGraphAssignment >> isAssignment [

	^ true
]

{ #category : #accessing }
ObjectGraphAssignment >> newValue [

	^ newValue
]

{ #category : #accessing }
ObjectGraphAssignment >> newValue: anObject [

	newValue := anObject
]

{ #category : #accessing }
ObjectGraphAssignment >> oldValue [

	^ oldValue
]

{ #category : #accessing }
ObjectGraphAssignment >> oldValue: anObject [

	oldValue := anObject
]

{ #category : #printing }
ObjectGraphAssignment >> printOn: aStream [

	aStream << variable asString << ':=' << newValue asString
]

{ #category : #accessing }
ObjectGraphAssignment >> variable [

	^ variable
]

{ #category : #accessing }
ObjectGraphAssignment >> variable: anObject [

	variable := anObject
]
