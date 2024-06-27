Class {
	#name : 'ScpAbstractObject',
	#superclass : 'Object',
	#instVars : [
		'identifier',
		'objectClass',
		'references'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'testing' }
ScpAbstractObject class >> isAbstract [

	^ self == ScpAbstractObject
]

{ #category : 'accessing' }
ScpAbstractObject >> addReference: anObject [

	references add: anObject
]

{ #category : 'accessing' }
ScpAbstractObject >> identifier [

	^ identifier
]

{ #category : 'accessing' }
ScpAbstractObject >> identifier: anObject [

	identifier := anObject
]

{ #category : 'accessing' }
ScpAbstractObject >> initialize [

	references := OrderedCollection new
]

{ #category : 'testing' }
ScpAbstractObject >> isClass [

	^ false
]

{ #category : 'testing' }
ScpAbstractObject >> isLiteral [
	
	^ false
]

{ #category : 'accessing' }
ScpAbstractObject >> objectClass [

	^ objectClass
]

{ #category : 'accessing' }
ScpAbstractObject >> objectClass: aScpClass [

	objectClass := aScpClass
]

{ #category : 'accessing' }
ScpAbstractObject >> references [

	^ references
]
