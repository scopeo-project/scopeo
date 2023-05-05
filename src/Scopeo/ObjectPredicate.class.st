Class {
	#name : #ObjectPredicate,
	#superclass : #Predicate,
	#instVars : [
		'objectId'
	],
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #testing }
ObjectPredicate class >> isAbstract [

	^ self == ObjectPredicate
]

{ #category : #'as yet unclassified' }
ObjectPredicate class >> objectNamed: aObjectName [

	^ self new 
		objectId: (self objectNamed: aObjectName) seekMyOid;
		yourself 
]

{ #category : #accessing }
ObjectPredicate >> objectId [

	^ objectId
]

{ #category : #accessing }
ObjectPredicate >> objectId: anObject [

	objectId := anObject
]
