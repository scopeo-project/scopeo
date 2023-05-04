Class {
	#name : #Going,
	#superclass : #Predicate,
	#instVars : [
		'objectName',
		'objectId'
	],
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #accessing }
Going class >> to: aObjectName [

	^ self new 
		oid: (self objectNamed: aObjectName) seekMyOid;
		yourself 
]

{ #category : #accessing }
Going >> oid: aObjectId [

	objectId := aObjectId
]

{ #category : #'target resize' }
Going >> verify: aEvent in: aEvents [
	
	^ aEvent isInteraction and: [ aEvent destinationId = objectId ]
]
