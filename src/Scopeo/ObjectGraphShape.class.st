Class {
	#name : #ObjectGraphShape,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'Scopeo-Graph-Visualization'
}

{ #category : #testing }
ObjectGraphShape class >> isAbstract [
		
	^ self == ObjectGraphShape
]

{ #category : #accessing }
ObjectGraphShape >> model [

	^ model
]

{ #category : #'API - building' }
ObjectGraphShape >> model: aModel [

	^ model := aModel
]

{ #category : #accessing }
ObjectGraphShape >> shape [

	self subclassResponsibility

]
