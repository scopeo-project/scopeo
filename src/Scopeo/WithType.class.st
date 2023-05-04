Class {
	#name : #WithType,
	#superclass : #Predicate,
	#instVars : [
		'type'
	],
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #'instance creation' }
WithType class >> of: aType [

	^ self new 
		type: aType; 
		yourself
]

{ #category : #accessing }
WithType >> type: aType [

	type := aType 
]

{ #category : #'target resize' }
WithType >> verify: aEvent in: aEvents [

	^ aEvent isInteraction 
		ifTrue: [ aEvent origin class = type or: [ aEvent destination class = type  ] ]
		ifFalse: [ aEvent object class = type ] 
]
