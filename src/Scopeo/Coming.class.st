Class {
	#name : #Coming,
	#superclass : #Predicate,
	#instVars : [
		'objectOid'
	],
	#category : #'Scopeo-Graph-Query'
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
Coming >> verify: aEdge in: aGraph [

	^ aEdge destination objectOid = objectOid
]
