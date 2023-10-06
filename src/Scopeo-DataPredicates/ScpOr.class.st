Class {
	#name : #ScpOr,
	#superclass : #ScpBinaryPredicate,
	#category : #'Scopeo-DataPredicates'
}

{ #category : #'target resize' }
ScpOr >> verify: aScpData [

	^ (left verify: aScpData) or: [
		  right verify: aScpData ]
]
