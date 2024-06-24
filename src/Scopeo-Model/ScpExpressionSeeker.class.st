Class {
	#name : #ScpExpressionSeeker,
	#superclass : #ScpExpressionVisitor,
	#instVars : [
		'identifierIndex',
		'identifierSuffix',
		'identifier'
	],
	#category : #'Scopeo-Model'
}

{ #category : #private }
ScpExpressionSeeker >> check: anExpression ifFound: aFoundBlock [

	| expressionIdentifier |

	identifierIndex := identifierIndex + 1.
	expressionIdentifier := identifierSuffix , identifierIndex asString.

	expressionIdentifier = identifier ifTrue: [ aFoundBlock value ].
]

{ #category : #accessing }
ScpExpressionSeeker >> find: aExpressionId in: aMethod [

	identifier := aExpressionId.
	identifierIndex := 0.
	identifierSuffix := aMethod name , '-'.
	
	^ aMethod expression accept: self.
	
]

{ #category : #visiting }
ScpExpressionSeeker >> visitArray: anArray [

	self check: anArray ifFound: [ ^ anArray ].

	^ super visitArray: anArray
]

{ #category : #visiting }
ScpExpressionSeeker >> visitAssignment: anAssignment [
	
	self check: anAssignment ifFound: [ ^ anAssignment ].
	
	^ super visitAssignment: anAssignment.
]

{ #category : #visiting }
ScpExpressionSeeker >> visitBlock: aBlock [
	
	self check: aBlock ifFound: [ ^ aBlock ].
	
	^ super visitBlock: aBlock.
]

{ #category : #visiting }
ScpExpressionSeeker >> visitLiteralArray: aLiteralArray [
	
	self check: aLiteralArray ifFound: [ ^ aLiteralArray ].
	
	^ super visitLiteralArray: aLiteralArray
]

{ #category : #visiting }
ScpExpressionSeeker >> visitLiteralValue: aLiteralValue [
	
	self check: aLiteralValue ifFound: [ ^ aLiteralValue ].
	
	^ nil.
]

{ #category : #visiting }
ScpExpressionSeeker >> visitMessageSend: aMessageSend [

	aMessageSend receiver isBlock ifFalse: [ 
		self check: aMessageSend ifFound: [ ^ aMessageSend ].	
	].
	
	^ super visitMessageSend: aMessageSend.
]

{ #category : #visiting }
ScpExpressionSeeker >> visitReturn: aReturn [
	
	self check: aReturn ifFound: [ ^ aReturn ].
	
	^ super visitReturn: aReturn.
]
