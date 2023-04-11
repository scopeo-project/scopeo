Class {
	#name : #IsIncomingInteraction,
	#superclass : #Predicate,
	#instVars : [
		'objectOid'
	],
	#category : #'Scopeo-Graph-Query'
}

{ #category : #accessing }
IsIncomingInteraction class >> oid: aObjectOid [

	^ self new 
		objectOid: aObjectOid;
		yourself 
]

{ #category : #accessing }
IsIncomingInteraction >> objectOid: aObjectOid [
	
	objectOid:= aObjectOid
]

{ #category : #'target resize' }
IsIncomingInteraction >> satisfies: aGraph [

	| graph |
	graph := ObjectGraph new.
	graph addEdges: (aGraph edges select: [ :e |
		e destination objectOid = objectOid
	]).
	^ graph
]
