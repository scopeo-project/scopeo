Class {
	#name : #Coming,
	#superclass : #ObjectPredicate,
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #accessing }
Coming class >> from: aObjectName [

	^ self objectNamed: aObjectName
]

{ #category : #'target resize' }
Coming >> verify: aEvent in: aProgramEvents [

	^ aEvent isInteraction and: [ aEvent originId = objectId ]
]
