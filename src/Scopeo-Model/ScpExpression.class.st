Class {
	#name : 'ScpExpression',
	#superclass : 'ScpStaticElement',
	#instVars : [
		'method',
		'parent'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'testing' }
ScpExpression class >> isAbstract [

	^ self == ScpExpression
]

{ #category : 'uml' }
ScpExpression class >> uml: aStream [

	super uml: aStream.
	self = ScpExpression ifTrue: [ 
		aStream cr << self name << ' o-- "parent" ' << self name.
	]
]

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
