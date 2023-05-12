Class {
	#name : #ScpInteractionsGraphShape,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'Scopeo-InteractionsVisualization'
}

{ #category : #testing }
ScpInteractionsGraphShape class >> isAbstract [
		
	^ self == ScpInteractionsGraphShape
]

{ #category : #accessing }
ScpInteractionsGraphShape >> model [

	^ model
]

{ #category : #'API - building' }
ScpInteractionsGraphShape >> model: aModel [

	^ model := aModel
]

{ #category : #accessing }
ScpInteractionsGraphShape >> shape [

	self subclassResponsibility

]
