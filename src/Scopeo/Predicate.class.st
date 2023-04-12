Class {
	#name : #Predicate,
	#superclass : #Object,
	#category : #'Scopeo-Graph-Query'
}

{ #category : #testing }
Predicate class >> isAbstract [
		
	^ self == Predicate
]

{ #category : #controlling }
Predicate >> and: aPredicate [

	^ And l: self r: aPredicate
]

{ #category : #controlling }
Predicate >> not [

	^ Not predicate: self
]

{ #category : #controlling }
Predicate >> or: aPredicate [

	^ Or l: self r: aPredicate
]

{ #category : #'target resize' }
Predicate >> verify: aEdge in: aGraph [
	
	self subclassResponsibility
]
