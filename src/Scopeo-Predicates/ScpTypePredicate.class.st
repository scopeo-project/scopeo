Class {
	#name : #ScpTypePredicate,
	#superclass : #ScpPredicate,
	#instVars : [
		'classObject'
	],
	#category : #'Scopeo-Predicates'
}

{ #category : #testing }
ScpTypePredicate class >> isAbstract [

	^ self == ScpTypePredicate
]

{ #category : #'instance creation' }
ScpTypePredicate class >> of: aClassObject [

	^ self new 
		classObject: aClassObject; 
		yourself
]

{ #category : #accessing }
ScpTypePredicate >> classObject [

	^ classObject
]

{ #category : #accessing }
ScpTypePredicate >> classObject: anObject [

	classObject := anObject
]
