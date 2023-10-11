Class {
	#name : #ScpMessageReceiverEq,
	#superclass : #ScpUnaryPredicate,
	#category : #'Scopeo-Search-Predicates'
}

{ #category : #verifying }
ScpMessageReceiverEq >> verify: aScpData [

	^ aScpData receiver == value
]
