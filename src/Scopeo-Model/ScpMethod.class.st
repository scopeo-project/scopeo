Class {
	#name : 'ScpMethod',
	#superclass : 'ScpStaticElement',
	#instVars : [
		'methodClass',
		'name',
		'body',
		'parameters',
		'expressions'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'uml' }
ScpMethod class >> uml: aStream [

	super uml: aStream.
	aStream cr << self name << ' --* ' << ScpSequence name.
	aStream cr << self name << ' --* "*" ' << ScpVariable name.
	aStream cr << self name << ' --* ' << ScpClass name.
]

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

	^ expressions at: anExpressionId ifAbsent: [ ^ nil ]
]

{ #category : 'accessing' }
ScpMethod >> expressionAt: anExpressionId put: anExpression [

	expressions at: anExpressionId ifAbsentPut: [ anExpression ].
	^ anExpression 
]

{ #category : 'initialization' }
ScpMethod >> initialize [

	parameters := OrderedCollection new.
	expressions := Dictionary new
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
