Class {
	#name : #ScpBooleanPredicate,
	#superclass : #ScpPredicate,
	#category : #'Scopeo-Predicates'
}

{ #category : #testing }
ScpBooleanPredicate class >> isAbstract [

	^ self == ScpBooleanPredicate
]
