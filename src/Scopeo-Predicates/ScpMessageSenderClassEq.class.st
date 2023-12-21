Class {
	#name : 'ScpMessageSenderClassEq',
	#superclass : 'ScpUnaryPredicate',
	#category : 'Scopeo-Predicates',
	#package : 'Scopeo-Predicates'
}

{ #category : 'verifying' }
ScpMessageSenderClassEq >> verify: aScpData [

	^ aScpData sender class == value
]
