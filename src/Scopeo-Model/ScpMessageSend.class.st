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

	arguments := anExpressionCollection asOrderedCollection.
	arguments do: [ :a | a parent: self ]
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
