Class {
	#name : 'ScpExpressionSeeker',
	#superclass : 'ScpExpressionVisitor',
	#instVars : [
		'identifierIndex',
		'identifierSuffix',
		'identifier',
		'expression'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'private' }
ScpExpressionSeeker >> check: anExpression [

	identifierIndex := identifierIndex + 1.
	identifierSuffix = identifier ifTrue: [ 
		expression := anExpression
	].
]

{ #category : 'accessing' }
ScpExpressionSeeker >> find: aExpressionId in: aMethod [

	identifier := aExpressionId.
	identifierIndex := 0.
	
	aMethod body accept: self.
	
	^ expression
	
]

{ #category : 'visiting' }
ScpExpressionSeeker >> visitAssignment: anAssignment [
	
	self check: anAssignment.
	
	^ super visitAssignment: anAssignment.
]

{ #category : 'visiting' }
ScpExpressionSeeker >> visitMessageSend: aMessageSend [

	aMessageSend receiver isBlock ifFalse: [ 
		self check: aMessageSend.	
	].
	
	^ super visitMessageSend: aMessageSend.
]

{ #category : 'visiting' }
ScpExpressionSeeker >> visitReturn: aReturn [
	
	self check: aReturn.
	
	^ super visitReturn: aReturn.
]
