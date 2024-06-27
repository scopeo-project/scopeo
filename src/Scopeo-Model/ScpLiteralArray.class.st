Class {
	#name : 'ScpLiteralArray',
	#superclass : 'ScpLiteral',
	#instVars : [
		'literals'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'visiting' }
ScpLiteralArray >> accept: aVisitor [

	^ aVisitor visitLiteralArray: self
]

{ #category : 'testing' }
ScpLiteralArray >> isLiteralArray [

	^ true
]

{ #category : 'accessing' }
ScpLiteralArray >> literals [

	^ literals
]

{ #category : 'accessing' }
ScpLiteralArray >> literals: aLiteralCollection [

	literals := aLiteralCollection asOrderedCollection.
	literals do: [ :l | l parent: self ]
]
