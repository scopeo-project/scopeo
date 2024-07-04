Class {
	#name : 'ScpObject',
	#superclass : 'ScpAbstractObject',
	#instVars : [
		'state'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'uml' }
ScpObject class >> uml: aStream [

	super uml: aStream.
	aStream cr << self name << ' --> "*" ' << ScpBindedVariable name.
]

{ #category : 'printing' }
ScpObject >> printOn: aStream [

	aStream << 'a ' << self objectClass asString
]

{ #category : 'accessing' }
ScpObject >> state [

	^ state
]

{ #category : 'accessing' }
ScpObject >> state: aBindedVariableList [

	state := aBindedVariableList
]
