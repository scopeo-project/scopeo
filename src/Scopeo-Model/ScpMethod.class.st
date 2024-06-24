Class {
	#name : #ScpMethod,
	#superclass : #ScpExecutionElement,
	#instVars : [
		'methodClass',
		'name',
		'body',
		'parameters'
	],
	#category : #'Scopeo-Model'
}

{ #category : #accessing }
ScpMethod >> body [

	^ body
]

{ #category : #accessing }
ScpMethod >> body: aSequenceExpression [

	body := aSequenceExpression
]

{ #category : #initialization }
ScpMethod >> initialize [

	parameters := OrderedCollection new.
]

{ #category : #accessing }
ScpMethod >> methodClass [

	^ methodClass
]

{ #category : #accessing }
ScpMethod >> methodClass: anObject [

	methodClass := anObject
]

{ #category : #accessing }
ScpMethod >> name [

	^ name
]

{ #category : #accessing }
ScpMethod >> name: aName [

	name := aName
]

{ #category : #accessing }
ScpMethod >> parameters [

	^ parameters
]

{ #category : #accessing }
ScpMethod >> parameters: anObject [

	parameters := anObject
]
