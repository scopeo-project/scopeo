Class {
	#name : #WithObject,
	#superclass : #ObjectPredicate,
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #'instance creation' }
WithObject class >> named: aObjectName [

	^ self objectNamed: aObjectName
]

{ #category : #'target resize' }
WithObject >> verify: aEvent in: aProgramEvents [
	
	self halt.
	
	^ aEvent isStateEvent 
		ifTrue: [ aEvent objectId = objectId ]
		ifFalse: [ aEvent originId = objectId or: [ aEvent destinationId = objectId ] ]
]
