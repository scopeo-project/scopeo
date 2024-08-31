Class {
	#name : 'ScpStateUpdated',
	#superclass : 'ScpObjectEvent',
	#instVars : [
		'variable',
		'value'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'uml' }
ScpStateUpdated class >> uml: aStream [

	super uml: aStream.
	
	aStream cr << self name << ' --> ' << ScpBindedVariable name.
]

{ #category : 'accessing' }
ScpStateUpdated >> value [

	^ value
]

{ #category : 'accessing' }
ScpStateUpdated >> value: aBindedAttribute [

	value := aBindedAttribute 
]

{ #category : 'accessing' }
ScpStateUpdated >> variable [

	^ variable
]

{ #category : 'accessing' }
ScpStateUpdated >> variable: anObject [

	variable := anObject
]
