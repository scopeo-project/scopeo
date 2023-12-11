Class {
	#name : 'ScpStateUpdate',
	#superclass : 'ScpTrace',
	#instVars : [
		'id',
		'object',
		'variable',
		'value'
	],
	#category : 'Scopeo-Traces',
	#package : 'Scopeo-Traces'
}

{ #category : 'accessing' }
ScpStateUpdate >> id [

	^ id
]

{ #category : 'accessing' }
ScpStateUpdate >> id: anObject [

	id := anObject
]

{ #category : 'testing' }
ScpStateUpdate >> isStateUpdate [

	^ true
]

{ #category : 'accessing' }
ScpStateUpdate >> object [

	^ object
]

{ #category : 'accessing' }
ScpStateUpdate >> object: anObject [

	object := anObject
]

{ #category : 'printing' }
ScpStateUpdate >> printString [

	^ object printString 
		, ': ' , variable name printString
		, ' := ' , value printString
]

{ #category : 'accessing' }
ScpStateUpdate >> value [

	^ value
]

{ #category : 'accessing' }
ScpStateUpdate >> value: anObject [

	value := anObject
]

{ #category : 'accessing' }
ScpStateUpdate >> variable [

	^ variable
]

{ #category : 'accessing' }
ScpStateUpdate >> variable: anObject [

	variable := anObject
]
