Class {
	#name : #Coming,
	#superclass : #ScpObjectPredicate,
	#category : #'Scopeo-Predicates'
}

{ #category : #accessing }
Coming class >> from: aObjectName [

	^ self objectNamed: aObjectName
]

{ #category : #'target resize' }
Coming >> verify: aEvent scope: aScope events: aProgramEvents [

	| objectId |
	
	objectId := (aScope getObject: objectName) id.

	^ aEvent isInteraction and: [ aEvent origin id = objectId ]
]
