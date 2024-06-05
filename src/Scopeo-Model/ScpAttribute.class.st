Class {
	#name : #ScpAttribute,
	#superclass : #ScpVariable,
	#instVars : [
		'attributeClass'
	],
	#category : 'Scopeo-Model'
}

{ #category : #'instance creation' }
ScpAttribute >> attributeClass [

	^ attributeClass
]

{ #category : #'instance creation' }
ScpAttribute >> attributeClass: aScpClass [

	attributeClass := aScpClass
]

{ #category : #printing }
ScpAttribute >> printOn: aStream [

	aStream << 'InstVar(' << self name asString << ')'
]
