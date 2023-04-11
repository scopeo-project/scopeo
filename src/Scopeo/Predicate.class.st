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
Predicate >> satisfies: aObject [
	
	self subclassResponsibility
]
