Class {
	#name : 'ScpReturn',
	#superclass : 'ScpExpression',
	#instVars : [
		'expression'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'uml' }
ScpReturn class >> uml: aStream [

	super uml: aStream.
	aStream cr << self name << ' o- ' << ScpExpression name
]

{ #category : 'visiting' }
ScpReturn >> accept: aVisitor [

	^ aVisitor visitReturn: self
]

{ #category : 'accessing' }
ScpReturn >> expression [

	^ expression
]

{ #category : 'accessing' }
ScpReturn >> expression: anExpression [

	expression := anExpression.
	expression parent: self
]
