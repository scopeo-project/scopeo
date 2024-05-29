Class {
	#name : 'ScpBindedVariable',
	#superclass : 'Object',
	#instVars : [
		'variable',
		'value'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'printing' }
ScpBindedVariable >> printOn: aStream [

	aStream << variable asString << ' value: ' << value asString
]

{ #category : 'accessing' }
ScpBindedVariable >> value [

	^ value
]

{ #category : 'accessing' }
ScpBindedVariable >> value: anObject [

	value := anObject
]

{ #category : 'accessing' }
ScpBindedVariable >> variable [

	^ variable
]

{ #category : 'accessing' }
ScpBindedVariable >> variable: anObject [

	variable := anObject
]
