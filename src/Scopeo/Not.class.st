Class {
	#name : #Not,
	#superclass : #BooleanPredicate,
	#instVars : [
		'predicate'
	],
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #accessing }
Not class >> predicate: aPredicate [
	
	^ self new
		predicate: aPredicate;
		yourself
]

{ #category : #accessing }
Not >> predicate: aPredicate [

	predicate := aPredicate
]

{ #category : #'target resize' }
Not >> verify: aEvent in: aProgramEvents [
	
	^ (predicate verify: aEvent in: aProgramEvents) not
]
