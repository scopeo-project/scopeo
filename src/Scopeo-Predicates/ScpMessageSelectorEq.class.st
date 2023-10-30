Class {
	#name : 'ScpMessageSelectorEq',
	#superclass : 'ScpUnaryPredicate',
	#category : 'Scopeo-Predicates',
	#package : 'Scopeo-Predicates'
}

{ #category : 'verifying' }
ScpMessageSelectorEq >> verify: aScpData [

	^ aScpData selector == value
]
