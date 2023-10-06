Class {
	#name : #ScpMessageReceiverEq,
	#superclass : #ScpUnaryPredicate,
	#category : #'Scopeo-DataPredicates'
}

{ #category : #verifying }
ScpMessageReceiverEq >> verify: aScpData [

	^ aScpData receiver == value
]
