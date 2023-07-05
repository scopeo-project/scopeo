Class {
	#name : #ScpEventPredicate,
	#superclass : #ScpPredicate,
	#instVars : [
		'limit',
		'eventName'
	],
	#category : #'Scopeo-Predicates'
}

{ #category : #accessing }
ScpEventPredicate class >> event: aEventName limit: aLimit [

	^ self new
		eventName: aEventName;
		limit: aLimit;
		yourself
]

{ #category : #testing }
ScpEventPredicate class >> isAbstract [

	^ self == ScpEventPredicate
]

{ #category : #accessing }
ScpEventPredicate >> eventName [

	^ eventName
]

{ #category : #accessing }
ScpEventPredicate >> eventName: anObject [

	eventName := anObject
]

{ #category : #accessing }
ScpEventPredicate >> limit [

	^ limit
]

{ #category : #accessing }
ScpEventPredicate >> limit: anObject [

	limit := anObject
]
