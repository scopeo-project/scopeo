Class {
	#name : #Going,
	#superclass : #ObjectPredicate,
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #accessing }
Going class >> to: aObjectName [

	^ self objectNamed: aObjectName
]

{ #category : #'target resize' }
Going >> verify: aEvent in: aProgramEvents [
	
	^ aEvent isInteraction and: [ aEvent destinationId = objectId ]
]
