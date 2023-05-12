Class {
	#name : #ScpInteractionPredicate,
	#superclass : #ScpPredicate,
	#instVars : [
		'values'
	],
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #'instance creation' }
ScpInteractionPredicate class >> in: aValues [

	^ self new 
		values: aValues;
		yourself
]

{ #category : #testing }
ScpInteractionPredicate class >> isAbstract [

	^ self == ScpInteractionPredicate
]

{ #category : #accessing }
ScpInteractionPredicate >> values [

	^ values
]

{ #category : #accessing }
ScpInteractionPredicate >> values: anObject [

	values := anObject
]
