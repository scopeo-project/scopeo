Class {
	#name : #Predicate,
	#superclass : #Object,
	#category : #'Scopeo-Graph-Query'
}

{ #category : #testing }
Predicate class >> isAbstract [
		
	^ self == Predicate
]

{ #category : #'target resize' }
Predicate >> verify: aEdge in: aGraph [
	
	self subclassResponsibility
]
