Class {
	#name : #Predicate,
	#superclass : #Object,
	#category : #'Scopeo-ObjectsEventsQuery'
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
Predicate >> verify: aEvent scope: aScope events: aProgamEvents [
	
	self subclassResponsibility
]
