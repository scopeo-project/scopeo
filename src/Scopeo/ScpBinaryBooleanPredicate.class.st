Class {
	#name : #ScpBinaryBooleanPredicate,
	#superclass : #ScpBooleanPredicate,
	#instVars : [
		'left',
		'right'
	],
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #testing }
ScpBinaryBooleanPredicate class >> isAbstract [
		
	^ self == ScpBinaryBooleanPredicate
]

{ #category : #instanciation }
ScpBinaryBooleanPredicate class >> l: aLeftPredicate r: aRightPredicate [

	^ self new 
		left: aLeftPredicate;
		right: aRightPredicate;
		yourself.
]

{ #category : #accessing }
ScpBinaryBooleanPredicate >> left: aLeftPredicate [

	left := aLeftPredicate
]

{ #category : #accessing }
ScpBinaryBooleanPredicate >> right: aRightPredicate [

	right := aRightPredicate
]
