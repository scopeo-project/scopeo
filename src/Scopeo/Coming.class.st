Class {
	#name : #Coming,
	#superclass : #ObjectPredicate,
	#category : #'Scopeo-ObjectsEventsQuery'
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
