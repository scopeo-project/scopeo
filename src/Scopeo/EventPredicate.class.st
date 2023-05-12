Class {
	#name : #EventPredicate,
	#superclass : #Predicate,
	#instVars : [
		'limit',
		'eventName'
	],
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #accessing }
EventPredicate class >> event: aEventName limit: aLimit [

	^ self new
		event: aEventName;
		limit: aLimit;
		yourself
]

{ #category : #testing }
EventPredicate class >> isAbstract [

	^ self == EventPredicate
]

{ #category : #accessing }
EventPredicate >> eventName [

	^ eventName
]

{ #category : #accessing }
EventPredicate >> eventName: anObject [

	eventName := anObject
]

{ #category : #accessing }
EventPredicate >> limit [

	^ limit
]

{ #category : #accessing }
EventPredicate >> limit: anObject [

	limit := anObject
]
