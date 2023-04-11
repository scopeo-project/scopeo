Class {
	#name : #IsOutgoingInteraction,
	#superclass : #Predicate,
	#instVars : [
		'objectOid'
	],
	#category : #'Scopeo-Graph-Query'
}

{ #category : #accessing }
IsOutgoingInteraction class >> oid: aObjectOid [

	^ self new 
		objectOid: aObjectOid;
		yourself 
]

{ #category : #accessing }
IsOutgoingInteraction >> objectOid: aObjectOid [
	
	objectOid:= aObjectOid
]

{ #category : #'target resize' }
IsOutgoingInteraction >> satisfies: aGraph [

	| graph |
	graph := ObjectGraph new.
	graph addEdges: (aGraph edges select: [ :e |
		e origin objectOid = objectOid
	]).
	^ graph
]
