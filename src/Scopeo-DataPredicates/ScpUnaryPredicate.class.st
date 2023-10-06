Class {
	#name : #ScpUnaryPredicate,
	#superclass : #ScpDataPredicate,
	#instVars : [
		'value'
	],
	#category : #'Scopeo-DataPredicates'
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
