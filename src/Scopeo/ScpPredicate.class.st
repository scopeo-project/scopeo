Class {
	#name : #ScpPredicate,
	#superclass : #Object,
	#category : #'Scopeo-ObjectsEventsQuery'
}

{ #category : #testing }
ScpPredicate class >> isAbstract [
		
	^ self == ScpPredicate
]

{ #category : #controlling }
ScpPredicate >> and: aPredicate [

	^ And l: self r: aPredicate
]

{ #category : #controlling }
ScpPredicate >> not [

	^ Not predicate: self
]

{ #category : #controlling }
ScpPredicate >> or: aPredicate [

	^ Or l: self r: aPredicate
]

{ #category : #'target resize' }
ScpPredicate >> verify: aEvent scope: aScope events: aProgamEvents [
	
	self subclassResponsibility
]