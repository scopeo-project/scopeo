Class {
	#name : 'ScpVariableReference',
	#superclass : 'ScpExpression',
	#instVars : [
		'variable'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'uml' }
ScpVariableReference class >> uml: aStream [

	super uml: aStream.
	aStream cr << self name << ' o-  ' << ScpVariable name
]

{ #category : 'visiting' }
ScpVariableReference >> accept: aVisitor [

	^ aVisitor visitVariableReference: self
]

{ #category : 'accessing' }
ScpVariableReference >> variable [

	^ variable
]

{ #category : 'accessing' }
ScpVariableReference >> variable: aVariable [

	variable := aVariable.
	variable addReference: self
]
