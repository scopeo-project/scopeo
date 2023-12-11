Class {
	#name : 'ScpAssignmentTrace',
	#superclass : 'ScpTrace',
	#instVars : [
		'object',
		'variable',
		'value'
	],
	#category : 'Scopeo-Traces',
	#package : 'Scopeo-Traces'
}

{ #category : 'printing' }
ScpAssignmentTrace >> asString [

	^ object asString 
		, ': ' , variable name asString
		, ' := ' , value asString
]

{ #category : 'testing' }
ScpAssignmentTrace >> isAssignment [

	^ true
]

{ #category : 'accessing' }
ScpAssignmentTrace >> object [

	^ object
]

{ #category : 'accessing' }
ScpAssignmentTrace >> object: anObject [

	object := anObject
]

{ #category : 'accessing' }
ScpAssignmentTrace >> value [

	^ value
]

{ #category : 'accessing' }
ScpAssignmentTrace >> value: anObject [

	value := anObject
]

{ #category : 'accessing' }
ScpAssignmentTrace >> variable [

	^ variable
]

{ #category : 'accessing' }
ScpAssignmentTrace >> variable: anObject [

	variable := anObject
]