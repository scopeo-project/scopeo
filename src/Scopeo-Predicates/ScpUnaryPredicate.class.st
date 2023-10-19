Class {
	#name : #ScpUnaryPredicate,
	#superclass : #ScpPredicate,
	#instVars : [
		'value'
	],
	#category : #'Scopeo-Predicates'
}

{ #category : #testing }
ScpUnaryPredicate class >> isAbstract [

	^ self == ScpUnaryPredicate
]

{ #category : #accessing }
ScpUnaryPredicate class >> value: aValue [
	^ self new
		  value: aValue;
		  yourself
]

{ #category : #evaluating }
ScpUnaryPredicate >> value [

	^ value
]

{ #category : #evaluating }
ScpUnaryPredicate >> value: aValue [

	value := aValue
]
