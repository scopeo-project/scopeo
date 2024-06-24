Class {
	#name : #ScpVariable,
	#superclass : #ScpExecutionElement,
	#instVars : [
		'name'
	],
	#category : #'Scopeo-Model'
}

{ #category : #accessing }
ScpVariable >> name [

	^ name
]

{ #category : #accessing }
ScpVariable >> name: aString [

	name := aString
]

{ #category : #printing }
ScpVariable >> printOn: aStream [

	aStream << 'Var(' << self name asString << ')'
]
