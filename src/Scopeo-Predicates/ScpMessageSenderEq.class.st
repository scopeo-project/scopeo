Class {
	#name : 'ScpMessageSenderEq',
	#superclass : 'ScpUnaryPredicate',
	#category : 'Scopeo-Predicates',
	#package : 'Scopeo-Predicates'
}

{ #category : 'verifying' }
ScpMessageSenderEq >> verify: aScpData [

	^ aScpData sender == value
]
