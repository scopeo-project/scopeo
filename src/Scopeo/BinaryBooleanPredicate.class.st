Class {
	#name : #BinaryBooleanPredicate,
	#superclass : #BooleanPredicate,
	#instVars : [
		'left',
		'right'
	],
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #testing }
BinaryBooleanPredicate class >> isAbstract [
		
	^ self == BinaryBooleanPredicate
]

{ #category : #'as yet unclassified' }
BinaryBooleanPredicate class >> l: aLeftPredicate r: aRightPredicate [

	^ self new 
		left: aLeftPredicate;
		right: aRightPredicate;
		yourself.
]

{ #category : #accessing }
BinaryBooleanPredicate >> left: aLeftPredicate [

	left := aLeftPredicate
]

{ #category : #accessing }
BinaryBooleanPredicate >> right: aRightPredicate [

	right := aRightPredicate
]
