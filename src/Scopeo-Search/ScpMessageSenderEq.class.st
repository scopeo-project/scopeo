Class {
	#name : #ScpMessageSenderEq,
	#superclass : #ScpUnaryPredicate,
	#category : #'Scopeo-Search-Predicates'
}

{ #category : #verifying }
ScpMessageSenderEq >> verify: aScpData [

	^ aScpData sender == value
]
