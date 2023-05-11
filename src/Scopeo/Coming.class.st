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
Coming >> verify: aEvent in: aProgramEvents [

	^ aEvent isInteraction and: [ aEvent originId = objectId ]
]
