Class {
	#name : 'ScpMethod',
	#superclass : 'Object',
	#instVars : [
		'methodClass',
		'name',
		'body',
		'parameters'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'accessing' }
ScpMethod >> body [

	^ body
]

{ #category : 'accessing' }
ScpMethod >> body: aSequenceExpression [

	body := aSequenceExpression
]

{ #category : 'accessing' }
ScpMethod >> expressionAt: anExpressionId [
]

{ #category : 'initialization' }
ScpMethod >> initialize [

	parameters := OrderedCollection new.
]

{ #category : 'accessing' }
ScpMethod >> methodClass [

	^ methodClass
]

{ #category : 'accessing' }
ScpMethod >> methodClass: aScpClass [

	methodClass := aScpClass.
	methodClass addMethod: self.
]

{ #category : 'accessing' }
ScpMethod >> name [

	^ name
]

{ #category : 'accessing' }
ScpMethod >> name: aStringOrSymbol [

	name := aStringOrSymbol asSymbol
]

{ #category : 'accessing' }
ScpMethod >> parameterNamed: aParameterName [

	^ parameters 
		detect: [ :p | p name = aParameterName ]
		ifFound: [ :p | ^ p ]
		ifNone: [ ^ nil ] 
]

{ #category : 'accessing' }
ScpMethod >> parameters [

	^ parameters
]

{ #category : 'accessing' }
ScpMethod >> parameters: aVariableCollection [

	parameters := aVariableCollection asOrderedCollection
]
