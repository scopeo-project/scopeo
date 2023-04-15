Class {
	#name : #Going,
	#superclass : #Predicate,
	#instVars : [
		'objectOid'
	],
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #accessing }
Going class >> from: aOid [

	^ self new 
		oid: aOid;
		yourself 
]

{ #category : #accessing }
Going >> oid: aOid [

	objectOid := aOid
]

{ #category : #'target resize' }
Going >> verify: aEvent in: aEvents [
	
	^ aEvent isInteraction and: [ aEvent origin objectOid = objectOid ]
]
