Class {
	#name : #ScpDataPredicate,
	#superclass : #Object,
	#category : #'Scopeo-Search-Predicates'
}

{ #category : #testing }
ScpDataPredicate class >> isAbstract [
		
	^ self == ScpDataPredicate
]

{ #category : #controlling }
ScpDataPredicate >> and: aPredicate [

	^ ScpAnd l: self r: aPredicate
]

{ #category : #controlling }
ScpDataPredicate >> not [

	^ ScpNot predicate: self
]

{ #category : #controlling }
ScpDataPredicate >> or: aPredicate [

	^ ScpOr l: self r: aPredicate
]

{ #category : #verifying }
ScpDataPredicate >> verify: aScpData [

	self subclassResponsibility
]
