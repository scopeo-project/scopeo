Class {
	#name : #ScpAnd,
	#superclass : #ScpBinaryPredicate,
	#category : #'Scopeo-Search-Predicates'
}

{ #category : #'target resize' }
ScpAnd >> verify: aScpData [

	^ (left verify: aScpData) and: [
		  right verify: aScpData ]
]
