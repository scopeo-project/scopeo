Class {
	#name : #IsObject,
	#superclass : #Predicate,
	#instVars : [
		'name',
		'objectId'
	],
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #'instance creation' }
IsObject class >> named: aObjectName [

	^ self new 
		oid: (self objectNamed: aObjectName) seekMyOid; 
		yourself
]

{ #category : #accessing }
IsObject >> oid: aObjectId [

	objectId := aObjectId
]

{ #category : #'target resize' }
IsObject >> verify: aEdge in: aGraph [
	
	^ aEdge isStateEvent 
		ifTrue: [ aEdge objectId = objectId ]
		ifFalse: [ aEdge originId = objectId or: [ aEdge destinationId = objectId ] ]
]
