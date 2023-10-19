Class {
	#name : #ScpMessageReceiverEq,
	#superclass : #ScpUnaryPredicate,
	#category : #'Scopeo-Predicates'
}

{ #category : #verifying }
ScpMessageReceiverEq >> verify: aScpData [

	^ aScpData receiver == value
]
