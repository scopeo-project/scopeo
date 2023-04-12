Class {
	#name : #Going,
	#superclass : #Predicate,
	#instVars : [
		'objectOid'
	],
	#category : #'Scopeo-Graph-Query'
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
Going >> verify: aEdge in: aGraph [
	
	^ aEdge origin objectOid = objectOid
]
