Class {
	#name : 'ScpObject',
	#superclass : 'ScpAbstractObject',
	#instVars : [
		'state'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

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
