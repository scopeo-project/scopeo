Class {
	#name : #ScpMessageSelectorEq,
	#superclass : #ScpUnaryPredicate,
	#category : #'Scopeo-Search-Predicates'
}

{ #category : #verifying }
ScpMessageSelectorEq >> verify: aScpData [

	^ aScpData selector == value
]
