Class {
	#name : #ObjectGraphMessage,
	#superclass : #ObjectGraphAction,
	#instVars : [
		'selector',
		'arguments'
	],
	#category : #'Scopeo-Graph'
}

{ #category : #accessing }
ObjectGraphMessage >> arguments [

	^ arguments
]

{ #category : #accessing }
ObjectGraphMessage >> arguments: anObject [

	arguments := anObject
]

{ #category : #testing }
ObjectGraphMessage >> isMessage [
	
	^ true
]

{ #category : #printing }
ObjectGraphMessage >> printOn: aStream [

	aStream << selector asString
]

{ #category : #accessing }
ObjectGraphMessage >> selector [

	^ selector
]

{ #category : #accessing }
ObjectGraphMessage >> selector: anObject [

	selector := anObject
]
