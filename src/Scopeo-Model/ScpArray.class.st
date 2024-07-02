Class {
	#name : 'ScpArray',
	#superclass : 'ScpExpression',
	#instVars : [
		'elements'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'uml' }
ScpArray class >> uml: aStream [

	super uml: aStream.
	aStream cr << self name << ' o- "elements" ' << ScpExpression name
]

{ #category : 'visiting' }
ScpArray >> accept: aVisitor [

	^ aVisitor visitArray: self
]

{ #category : 'accessing' }
ScpArray >> elements [

	^ elements
]

{ #category : 'accessing' }
ScpArray >> elements: anExpressionCollection [

	elements := anExpressionCollection asOrderedCollection.
	elements do: [ :e | e parent: self ]
]
