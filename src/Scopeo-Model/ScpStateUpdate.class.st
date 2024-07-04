Class {
	#name : 'ScpStateUpdate',
	#superclass : 'ScpObjectEvent',
	#instVars : [
		'value'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'uml' }
ScpStateUpdate class >> uml: aStream [

	super uml: aStream.
	
	aStream cr << self name << ' --> ' << ScpBindedVariable name.
]

{ #category : 'accessing' }
ScpStateUpdate >> value [

	^ value
]

{ #category : 'accessing' }
ScpStateUpdate >> value: aBindedAttribute [

	value := aBindedAttribute 
]
