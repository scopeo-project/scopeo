Class {
	#name : #OnlyType,
	#superclass : #Predicate,
	#instVars : [
		'type'
	],
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #'instance creation' }
OnlyType class >> of: aType [

	^ self new 
		type: aType; 
		yourself
]

{ #category : #accessing }
OnlyType >> type: aType [

	type := aType 
]

{ #category : #'target resize' }
OnlyType >> verify: aEvent in: aEvents [

	^ aEvent isInteraction 
		ifTrue: [ aEvent origin class = type and: [ aEvent destination class = type  ] ]
		ifFalse: [ aEvent object class = type ] 
]
