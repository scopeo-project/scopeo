Class {
	#name : 'ScpVariable',
	#superclass : 'Object',
	#instVars : [
		'name'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'accessing' }
ScpVariable >> name [

	^ name
]

{ #category : 'accessing' }
ScpVariable >> name: aString [

	name := aString
]

{ #category : 'printing' }
ScpVariable >> printOn: aStream [

	aStream << 'Var(' << self name asString << ')'
]
