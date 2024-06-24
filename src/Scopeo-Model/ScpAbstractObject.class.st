Class {
	#name : #ScpAbstractObject,
	#superclass : #ScpExecutionElement,
	#instVars : [
		'objectClass'
	],
	#category : #'Scopeo-Model'
}

{ #category : #testing }
ScpAbstractObject class >> isAbstract [

	^ self == ScpAbstractObject
]

{ #category : #testing }
ScpAbstractObject >> isLiteral [
	
	^ false
]

{ #category : #accessing }
ScpAbstractObject >> objectClass [

	^ objectClass
]

{ #category : #accessing }
ScpAbstractObject >> objectClass: aScpClass [

	objectClass := aScpClass
]
