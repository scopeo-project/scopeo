Class {
	#name : 'ScpExpression',
	#superclass : 'Object',
	#instVars : [
		'method',
		'parent'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'visiting' }
ScpExpression >> accept: aVisitor [

	self subclassResponsibility
]

{ #category : 'testing' }
ScpExpression >> isBlock [

	^ false
]

{ #category : 'testing' }
ScpExpression >> isLiteral [

	^ false
]

{ #category : 'accessing' }
ScpExpression >> method [

	^ method
]

{ #category : 'accessing' }
ScpExpression >> method: anObject [

	method := anObject
]

{ #category : 'accessing' }
ScpExpression >> parent [

	^ parent
]

{ #category : 'accessing' }
ScpExpression >> parent: anExpression [

	parent := anExpression
]
