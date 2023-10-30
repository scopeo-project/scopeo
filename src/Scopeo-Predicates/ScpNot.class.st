Class {
	#name : 'ScpNot',
	#superclass : 'ScpUnaryPredicate',
	#category : 'Scopeo-Predicates',
	#package : 'Scopeo-Predicates'
}

{ #category : 'accessing' }
ScpNot class >> predicate: aPredicate [
	
	^ self new
		predicate: aPredicate;
		yourself
]

{ #category : 'target resize' }
ScpNot >> verify: aScpData [

	^ (value verify: aScpData) not
]
