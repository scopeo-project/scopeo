Class {
	#name : 'ScpObject',
	#superclass : 'Object',
	#instVars : [
		'objectClass',
		'state'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'accessing' }
ScpObject >> objectClass [

	^ objectClass
]

{ #category : 'accessing' }
ScpObject >> objectClass: aScpClass [

	objectClass := aScpClass
]

{ #category : 'accessing' }
ScpObject >> state [

	^ state
]

{ #category : 'accessing' }
ScpObject >> state: aBindedVariableList [

	state := aBindedVariableList
]
