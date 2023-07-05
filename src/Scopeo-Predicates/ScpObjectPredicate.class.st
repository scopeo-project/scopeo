Class {
	#name : #ScpObjectPredicate,
	#superclass : #ScpPredicate,
	#instVars : [
		'objectName'
	],
	#category : #'Scopeo-Predicates'
}

{ #category : #testing }
ScpObjectPredicate class >> isAbstract [

	^ self == ScpObjectPredicate
]

{ #category : #'as yet unclassified' }
ScpObjectPredicate class >> objectNamed: aObjectName [

	^ self new 
		objectName: aObjectName
		yourself 
]

{ #category : #accessing }
ScpObjectPredicate >> objectName [

	^ objectName
]

{ #category : #accessing }
ScpObjectPredicate >> objectName: anObject [

	objectName := anObject
]
