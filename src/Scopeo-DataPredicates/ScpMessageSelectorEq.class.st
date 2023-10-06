Class {
	#name : #ScpMessageSelectorEq,
	#superclass : #ScpUnaryPredicate,
	#category : #'Scopeo-DataPredicates'
}

{ #category : #verifying }
ScpMessageSelectorEq >> verify: aScpData [

	^ aScpData selector == value
]
