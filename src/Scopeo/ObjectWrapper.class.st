Class {
	#name : #ObjectWrapper,
	#superclass : #Object,
	#instVars : [
		'id',
		'object'
	],
	#category : #'Scopeo-ObjectsEventsModel'
}

{ #category : #'as yet unclassified' }
ObjectWrapper class >> fromId: aObjectId object: aObject [

	^ self new
		id: aObjectId;
		object: aObject;
		yourself
]

{ #category : #accessing }
ObjectWrapper >> get [

	^ object
]

{ #category : #accessing }
ObjectWrapper >> id [

	^ id
]

{ #category : #accessing }
ObjectWrapper >> id: anObject [

	id := anObject
]

{ #category : #accessing }
ObjectWrapper >> object: anObject [

	object := anObject
]

{ #category : #printing }
ObjectWrapper >> printOn: aStream [

	aStream 
		<< object asString
		<< '(' << id asString  << ')'
]
