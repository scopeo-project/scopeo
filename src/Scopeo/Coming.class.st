Class {
	#name : #Coming,
	#superclass : #Predicate,
	#instVars : [
		'objectOid'
	],
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #accessing }
Coming class >> to: aOid [

	^ self new 
		oid: aOid;
		yourself 
]

{ #category : #accessing }
Coming >> oid: aOid [

	objectOid := aOid
]

{ #category : #'target resize' }
Coming >> verify: aEvent in: aEvents [

	^ aEvent isInteraction and: [ aEvent destination objectOid = objectOid ]
]
