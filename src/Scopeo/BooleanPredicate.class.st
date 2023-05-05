Class {
	#name : #BooleanPredicate,
	#superclass : #Predicate,
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #testing }
BooleanPredicate class >> isAbstract [

	^ self == BooleanPredicate
]
