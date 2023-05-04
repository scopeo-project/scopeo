Class {
	#name : #Coming,
	#superclass : #Predicate,
	#instVars : [
		'objectId'
	],
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #accessing }
Coming class >> from: aObjectName [

	^ self new 
		oid: (self objectNamed: aObjectName) seekMyOid;
		yourself 
]

{ #category : #accessing }
Coming >> oid: aObjectId [

	objectId := aObjectId
]

{ #category : #'target resize' }
Coming >> verify: aEvent in: aEvents [

	^ aEvent isInteraction and: [ aEvent originId = objectId ]
]
