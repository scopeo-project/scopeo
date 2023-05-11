Class {
	#name : #TypePredicate,
	#superclass : #Predicate,
	#instVars : [
		'classObject'
	],
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #testing }
TypePredicate class >> isAbstract [

	^ self == TypePredicate
]

{ #category : #'instance creation' }
TypePredicate class >> of: aClassObject [

	^ self new 
		classObject: aClassObject; 
		yourself
]

{ #category : #accessing }
TypePredicate >> classObject [

	^ classObject
]

{ #category : #accessing }
TypePredicate >> classObject: anObject [

	classObject := anObject
]
