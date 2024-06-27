Class {
	#name : 'ScpObjectLiteral',
	#superclass : 'ScpAbstractObject',
	#instVars : [
		'literalValue'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'testing' }
ScpObjectLiteral >> isLiteral [

	^ true
]

{ #category : 'accessing' }
ScpObjectLiteral >> literalValue [

	^ literalValue
]

{ #category : 'accessing' }
ScpObjectLiteral >> literalValue: aValue [

	literalValue := aValue
]

{ #category : 'printing' }
ScpObjectLiteral >> printOn: aStream [

	aStream << self literalValue asString
]
