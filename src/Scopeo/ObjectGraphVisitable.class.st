Class {
	#name : #ObjectGraphVisitable,
	#superclass : #Object,
	#category : #'Scopeo-Graph'
}

{ #category : #testing }
ObjectGraphVisitable class >> isAbstract [
		
	^ self == ObjectGraphVisitable
]

{ #category : #visiting }
ObjectGraphVisitable >> accept: aVisitor [
	
	self subclassResponsibility
]
