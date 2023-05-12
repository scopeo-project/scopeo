Class {
	#name : #ObjectPredicate,
	#superclass : #Predicate,
	#instVars : [
		'objectName'
	],
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #testing }
ObjectPredicate class >> isAbstract [

	^ self == ObjectPredicate
]

{ #category : #'as yet unclassified' }
ObjectPredicate class >> objectNamed: aObjectName [

	^ self new 
		objectName: aObjectName
		yourself 
]

{ #category : #accessing }
ObjectPredicate >> objectName [

	^ objectName
]

{ #category : #accessing }
ObjectPredicate >> objectName: anObject [

	objectName := anObject
]
