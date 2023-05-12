Class {
	#name : #Going,
	#superclass : #ScpObjectPredicate,
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #accessing }
Going class >> to: aObjectName [

	^ self objectNamed: aObjectName
]

{ #category : #'target resize' }
Going >> verify: aEvent scope: aScope events: aProgramEvents [
	
	| objectId |
	
	objectId := (aScope getObject: objectName) id.
	
	^ aEvent isInteraction and: [ aEvent destination id = objectId ]
]
