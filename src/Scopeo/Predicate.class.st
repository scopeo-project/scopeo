Class {
	#name : #Predicate,
	#superclass : #Object,
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #testing }
Predicate class >> isAbstract [
		
	^ self == Predicate
]

{ #category : #'as yet unclassified' }
Predicate class >> objectNamed: aName [
	 
	| chest |
	chest := Chest named: 'ScopeoObjects'.
	^ chest at: aName
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
