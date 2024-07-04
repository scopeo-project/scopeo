Class {
	#name : 'ScpBindedVariable',
	#superclass : 'ScpDynamicElement',
	#instVars : [
		'variable',
		'value'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'uml' }
ScpBindedVariable class >> uml: aStream [

	super uml: aStream.
	aStream cr << self name << ' --> ' << ScpAbstractObject name.
	aStream cr << self name << ' --> ' << ScpVariable name.
]

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
