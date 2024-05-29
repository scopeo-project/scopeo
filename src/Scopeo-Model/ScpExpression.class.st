Class {
	#name : 'ScpExpression',
	#superclass : 'Object',
	#instVars : [
		'identifier',
		'method'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'accessing' }
ScpExpression >> identifier [

	^ identifier
]

{ #category : 'accessing' }
ScpExpression >> identifier: anObject [

	identifier := anObject
]

{ #category : 'accessing' }
ScpExpression >> method [

	^ method
]

{ #category : 'accessing' }
ScpExpression >> method: anObject [

	method := anObject
]
