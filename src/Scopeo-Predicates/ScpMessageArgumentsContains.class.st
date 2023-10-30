Class {
	#name : 'ScpMessageArgumentsContains',
	#superclass : 'ScpUnaryPredicate',
	#category : 'Scopeo-Predicates',
	#package : 'Scopeo-Predicates'
}

{ #category : 'verifying' }
ScpMessageArgumentsContains >> verify: aScpData [

	^ aScpData arguments includesAny: value
]
