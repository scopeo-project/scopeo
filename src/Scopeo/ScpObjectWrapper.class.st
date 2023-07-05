Class {
	#name : #ScpObjectWrapper,
	#superclass : #Object,
	#instVars : [
		'id',
		'object'
	],
	#category : #'Scopeo-Model'
}

{ #category : #'as yet unclassified' }
ScpObjectWrapper class >> fromId: aObjectId object: aObject [

	^ self new
		id: aObjectId;
		object: aObject;
		yourself
]

{ #category : #accessing }
ScpObjectWrapper >> get [

	^ object
]

{ #category : #accessing }
ScpObjectWrapper >> id [

	^ id
]

{ #category : #accessing }
ScpObjectWrapper >> id: anObject [

	id := anObject
]

{ #category : #accessing }
ScpObjectWrapper >> object: anObject [

	object := anObject
]

{ #category : #printing }
ScpObjectWrapper >> printOn: aStream [

	aStream 
		<< object asString
		<< '(' << id asString  << ')'
]
