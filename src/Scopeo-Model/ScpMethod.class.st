Class {
	#name : 'ScpMethod',
	#superclass : 'Object',
	#instVars : [
		'methodClass',
		'name',
		'parameters',
		'coverage'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'adding' }
ScpMethod >> addCoveredExpression: anExpression [

	anExpression method: self.
	coverage add: anExpression.
]

{ #category : 'accessing' }
ScpMethod >> coverage [

	^ coverage
]

{ #category : 'accessing' }
ScpMethod >> coverage: anObject [

	coverage := anObject
]

{ #category : 'initialization' }
ScpMethod >> initialize [

	coverage := Set new
]

{ #category : 'accessing' }
ScpMethod >> methodClass [

	^ methodClass
]

{ #category : 'accessing' }
ScpMethod >> methodClass: anObject [

	methodClass := anObject
]

{ #category : 'accessing' }
ScpMethod >> name [

	^ name
]

{ #category : 'accessing' }
ScpMethod >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
ScpMethod >> parameters [

	^ parameters
]

{ #category : 'accessing' }
ScpMethod >> parameters: aVariable [

	parameters := aVariable
]
