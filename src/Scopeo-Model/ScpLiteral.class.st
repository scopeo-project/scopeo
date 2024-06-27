Class {
	#name : 'ScpLiteral',
	#superclass : 'ScpExpression',
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'testing' }
ScpLiteral class >> isAbstract [

	^ self == ScpLiteral
]

{ #category : 'testing' }
ScpLiteral >> isLiteral [

	^ true
]

{ #category : 'testing' }
ScpLiteral >> isLiteralArray [

	^ false
]
