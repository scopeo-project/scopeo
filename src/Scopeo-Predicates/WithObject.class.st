Class {
	#name : #WithObject,
	#superclass : #ScpObjectPredicate,
	#category : #'Scopeo-Predicates'
}

{ #category : #'instance creation' }
WithObject class >> named: aObjectName [

	^ self objectNamed: aObjectName
]

{ #category : #'target resize' }
WithObject >> verify: aEvent scope: aScope events: aProgramEvents [
	
	| objectId |
	
	objectId := (aScope getObject: objectName) id.
	
	^ aEvent isStateEvent 
		ifTrue: [ aEvent object id = objectId ]
		ifFalse: [ aEvent origin id = objectId or: [ aEvent destination id = objectId ] ]
]
