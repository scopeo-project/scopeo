Class {
	#name : #ScpMessageSenderEq,
	#superclass : #ScpUnaryPredicate,
	#category : #'Scopeo-DataPredicates'
}

{ #category : #verifying }
ScpMessageSenderEq >> verify: aScpData [

	^ aScpData sender == value
]
