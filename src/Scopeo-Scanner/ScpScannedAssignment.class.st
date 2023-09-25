Class {
	#name : #ScpScannedAssignment,
	#superclass : #Object,
	#instVars : [
		'id',
		'object',
		'variable',
		'oldValue',
		'newValue'
	],
	#category : #'Scopeo-Scanner'
}

{ #category : #accessing }
ScpScannedAssignment >> id [

	^ id
]

{ #category : #accessing }
ScpScannedAssignment >> id: anObject [

	id := anObject
]

{ #category : #accessing }
ScpScannedAssignment >> newValue [

	^ newValue
]

{ #category : #accessing }
ScpScannedAssignment >> newValue: anObject [

	newValue := anObject
]

{ #category : #accessing }
ScpScannedAssignment >> object [

	^ object
]

{ #category : #accessing }
ScpScannedAssignment >> object: anObject [

	object := anObject
]

{ #category : #accessing }
ScpScannedAssignment >> oldValue [

	^ oldValue
]

{ #category : #accessing }
ScpScannedAssignment >> oldValue: anObject [

	oldValue := anObject
]

{ #category : #printing }
ScpScannedAssignment >> printString [

	^ object printString 
		, ': ' , variable name printString
		, ' := ' , newValue printString
]

{ #category : #accessing }
ScpScannedAssignment >> variable [

	^ variable
]

{ #category : #accessing }
ScpScannedAssignment >> variable: anObject [

	variable := anObject
]
