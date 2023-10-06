Class {
	#name : #ScpMessageArgumentsContains,
	#superclass : #ScpUnaryPredicate,
	#category : #'Scopeo-DataPredicates'
}

{ #category : #verifying }
ScpMessageArgumentsContains >> verify: aScpData [

	^ aScpData arguments includesAny: value
]
