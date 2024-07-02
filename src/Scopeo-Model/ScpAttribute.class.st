Class {
	#name : 'ScpAttribute',
	#superclass : 'ScpVariable',
	#instVars : [
		'attributeClass'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'uml' }
ScpAttribute class >> uml: aStream [

	super uml: aStream.

	aStream cr << self name << ' -> ' << ScpClass name.
]

{ #category : 'instance creation' }
ScpAttribute >> attributeClass [

	^ attributeClass
]

{ #category : 'instance creation' }
ScpAttribute >> attributeClass: aScpClass [

	attributeClass := aScpClass
]

{ #category : 'printing' }
ScpAttribute >> printOn: aStream [

	aStream << 'InstVar(' << self name asString << ')'
]
