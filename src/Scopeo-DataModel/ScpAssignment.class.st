Class {
	#name : #ScpAssignment,
	#superclass : #ScpData,
	#instVars : [
		'id',
		'object',
		'variable',
		'oldValue',
		'newValue'
	],
	#category : #'Scopeo-DataModel'
}

{ #category : #accessing }
ScpAssignment >> id [

	^ id
]

{ #category : #accessing }
ScpAssignment >> id: anObject [

	id := anObject
]

{ #category : #testing }
ScpAssignment >> isAssignment [

	^ true
]

{ #category : #accessing }
ScpAssignment >> newValue [

	^ newValue
]

{ #category : #accessing }
ScpAssignment >> newValue: anObject [

	newValue := anObject
]

{ #category : #accessing }
ScpAssignment >> object [

	^ object
]

{ #category : #accessing }
ScpAssignment >> object: anObject [

	object := anObject
]

{ #category : #accessing }
ScpAssignment >> oldValue [

	^ oldValue
]

{ #category : #accessing }
ScpAssignment >> oldValue: anObject [

	oldValue := anObject
]

{ #category : #printing }
ScpAssignment >> printString [

	^ object printString 
		, ': ' , variable name printString
		, ' := ' , newValue printString
]

{ #category : #accessing }
ScpAssignment >> variable [

	^ variable
]

{ #category : #accessing }
ScpAssignment >> variable: anObject [

	variable := anObject
]
