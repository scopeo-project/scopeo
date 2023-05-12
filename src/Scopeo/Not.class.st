Class {
	#name : #Not,
	#superclass : #ScpBooleanPredicate,
	#instVars : [
		'predicate'
	],
	#category : #'Scopeo-ObjectsEventsQuery'
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
Not >> verify: aEvent scope: aScope events: aProgramEvents [

	^ (predicate verify: aEvent scope: aScope events: aProgramEvents) not
]
