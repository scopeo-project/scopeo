Class {
	#name : #Argument,
	#superclass : #Predicate,
	#instVars : [
		'value'
	],
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #accessing }
Argument class >> is: aObject [
	^ self new 
		value: aObject;
		yourself
]

{ #category : #accessing }
Argument >> value: aObject [

	value := aObject
]

{ #category : #'target resize' }
Argument >> verify: aEdge in: aEvents [
	
	^ aEdge isInteraction and: [ aEdge arguments includes: value ]
]
