Class {
	#name : #IsObject,
	#superclass : #Predicate,
	#instVars : [
		'name'
	],
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #'instance creation' }
IsObject class >> named: aName [

	^ self new 
		name: aName; 
		yourself
]

{ #category : #accessing }
IsObject >> name [

	^ name
]

{ #category : #accessing }
IsObject >> name: anObject [

	name := anObject
]

{ #category : #'target resize' }
IsObject >> verify: aEdge in: aGraph [
	
	| object oid |
	
	object := [ 
		| chest |
		chest := Chest named: 'Scopeo'.
		chest at: name
	] on: KeyNotFound do: [ ^ false ].
	oid := object seekMyOid.
	
	^ aEdge isStateEvent 
		ifTrue: [ aEdge objectId = oid ]
		ifFalse: [ aEdge originId = oid or: [ aEdge destinationId = oid ] ]
]
