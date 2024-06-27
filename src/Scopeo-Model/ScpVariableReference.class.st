Class {
	#name : 'ScpVariableReference',
	#superclass : 'ScpExpression',
	#instVars : [
		'variable'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'visiting' }
ScpVariableReference >> accept: aVisitor [

	^ aVisitor visitVariableReference: self
]

{ #category : 'private' }
ScpVariableReference >> nextEvent: anEvent [

	self previousEvent ifNotNil: [ :e | e next: anEvent ].
	events push: anEvent
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
