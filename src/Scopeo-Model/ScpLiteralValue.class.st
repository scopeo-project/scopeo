Class {
	#name : 'ScpLiteralValue',
	#superclass : 'ScpLiteral',
	#instVars : [
		'literal'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'uml' }
ScpLiteralValue class >> uml: aStream [

	super uml: aStream.
	aStream cr << self name << ' o- ' << ScpObjectLiteral name
]

{ #category : 'visiting' }
ScpLiteralValue >> accept: aVisitor [

	^ aVisitor visitLiteralValue: self
]

{ #category : 'accessing' }
ScpLiteralValue >> literal [

	^ literal
]

{ #category : 'accessing' }
ScpLiteralValue >> literal: anObject [

	literal := anObject
]
