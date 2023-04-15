Class {
	#name : #Type,
	#superclass : #Predicate,
	#instVars : [
		'type'
	],
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #'instance creation' }
Type class >> of: aType [

	^ self new 
		type: aType; 
		yourself
]

{ #category : #accessing }
Type >> type: aType [

	type := aType 
]

{ #category : #'target resize' }
Type >> verify: aEvent in: aEvents [
	
	^ aEvent isInteraction 
		ifTrue: [ aEvent origin class = type and: [ aEvent destination class = type  ] ]
		ifFalse: [ aEvent object class = type ] 
]
