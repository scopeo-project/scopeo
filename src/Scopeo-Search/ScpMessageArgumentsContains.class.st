Class {
	#name : #ScpMessageArgumentsContains,
	#superclass : #ScpUnaryPredicate,
	#category : #'Scopeo-Search-Predicates'
}

{ #category : #verifying }
ScpMessageArgumentsContains >> verify: aScpData [

	^ aScpData arguments includesAny: value
]
