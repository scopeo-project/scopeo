Class {
	#name : 'ScpPredicate',
	#superclass : 'Object',
	#category : 'Scopeo-Predicates',
	#package : 'Scopeo-Predicates'
}

{ #category : 'testing' }
ScpPredicate class >> isAbstract [
		
	^ self == ScpPredicate
]

{ #category : 'controlling' }
ScpPredicate >> and: aPredicate [

	^ ScpAnd l: self r: aPredicate
]

{ #category : 'controlling' }
ScpPredicate >> not [

	^ ScpNot predicate: self
]

{ #category : 'controlling' }
ScpPredicate >> or: aPredicate [

	^ ScpOr l: self r: aPredicate
]

{ #category : 'verifying' }
ScpPredicate >> verify: aScpData [

	self subclassResponsibility
]
