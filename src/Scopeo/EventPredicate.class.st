Class {
	#name : #EventPredicate,
	#superclass : #Predicate,
	#instVars : [
		'event',
		'limit'
	],
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #accessing }
EventPredicate class >> event: aEventName limit: aLimit [

	^ self new
		event: (self eventNamed: aEventName);
		limit: aLimit;
		yourself
]

{ #category : #testing }
EventPredicate class >> isAbstract [

	^ self == EventPredicate
]

{ #category : #accessing }
EventPredicate >> event [

	^ event
]

{ #category : #accessing }
EventPredicate >> event: anObject [

	event := anObject
]

{ #category : #accessing }
EventPredicate >> limit [

	^ limit
]

{ #category : #accessing }
EventPredicate >> limit: anObject [

	limit := anObject
]
