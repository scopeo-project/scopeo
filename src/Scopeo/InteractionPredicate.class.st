Class {
	#name : #InteractionPredicate,
	#superclass : #Predicate,
	#instVars : [
		'values'
	],
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #'instance creation' }
InteractionPredicate class >> in: aValues [

	^ self new 
		values: aValues;
		yourself
]

{ #category : #testing }
InteractionPredicate class >> isAbstract [

	^ self == InteractionPredicate
]

{ #category : #accessing }
InteractionPredicate >> values [

	^ values
]

{ #category : #accessing }
InteractionPredicate >> values: anObject [

	values := anObject
]
