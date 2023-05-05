Class {
	#name : #IsObject,
	#superclass : #ObjectPredicate,
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #'instance creation' }
IsObject class >> named: aObjectName [

	^ self objectNamed: aObjectName
]

{ #category : #'target resize' }
IsObject >> verify: aEdge in: aProgramEvents [
	
	^ aEdge isStateEvent 
		ifTrue: [ aEdge objectId = objectId ]
		ifFalse: [ aEdge originId = objectId or: [ aEdge destinationId = objectId ] ]
]
