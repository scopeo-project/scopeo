Class {
	#name : #BinaryPredicate,
	#superclass : #Predicate,
	#instVars : [
		'left',
		'right'
	],
	#category : #'Scopeo-Graph-Query'
}

{ #category : #testing }
BinaryPredicate class >> isAbstract [
		
	^ self == BinaryPredicate
]

{ #category : #'as yet unclassified' }
BinaryPredicate class >> l: aLeftPredicate r: aRightPredicate [

	^ self new 
		left: aLeftPredicate;
		right: aRightPredicate;
		yourself.
]

{ #category : #accessing }
BinaryPredicate >> left: aLeftPredicate [

	left := aLeftPredicate
]

{ #category : #accessing }
BinaryPredicate >> right: aRightPredicate [

	right := aRightPredicate
]
