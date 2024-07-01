Class {
	#name : 'ScpMessageSend',
	#superclass : 'ScpExpression',
	#instVars : [
		'receiver',
		'selector',
		'arguments'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'visiting' }
ScpMessageSend >> accept: aVisitor [

	^ aVisitor visitMessageSend: self
]

{ #category : 'accessing' }
ScpMessageSend >> arguments [

	^ arguments
]

{ #category : 'accessing' }
ScpMessageSend >> arguments: anExpressionCollection [

	anExpressionCollection ifNil: [ self error: 'Invalid list of arguments nil.' ].

	arguments := anExpressionCollection asOrderedCollection.
	arguments do: [ :a | a parent: self ]
]

{ #category : 'initialization' }
ScpMessageSend >> initialize [

	arguments := OrderedCollection new
]

{ #category : 'accessing' }
ScpMessageSend >> receiver [

	^ receiver
]

{ #category : 'accessing' }
ScpMessageSend >> receiver: anExpression [

	receiver := anExpression.
	receiver parent: self
]

{ #category : 'accessing' }
ScpMessageSend >> selector [

	^ selector
]

{ #category : 'accessing' }
ScpMessageSend >> selector: aStringOrSymbol [

	selector := aStringOrSymbol asSymbol
]
