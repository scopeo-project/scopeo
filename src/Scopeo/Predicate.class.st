Class {
	#name : #Predicate,
	#superclass : #Object,
	#category : #'Scopeo-Model-Filter-API'
}

{ #category : #'as yet unclassified' }
Predicate class >> eventNamed: aName [
	 
	| eventsChest |
	eventsChest := self class titleToChestName: self class eventsTitle.
	eventsChest := Chest named: eventsChest.
	^ eventsChest at: aName
]

{ #category : #testing }
Predicate class >> isAbstract [
		
	^ self == Predicate
]

{ #category : #'as yet unclassified' }
Predicate class >> objectNamed: aName [
	 
	| objectsChest |
	objectsChest := self class titleToChestName: self class objectsTitle.
	objectsChest := Chest named: objectsChest.
	^ objectsChest at: aName
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
Predicate >> verify: aEvent in: aProgamEvents [
	
	self subclassResponsibility
]
