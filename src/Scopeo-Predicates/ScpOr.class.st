Class {
	#name : 'ScpOr',
	#superclass : 'ScpBinaryPredicate',
	#category : 'Scopeo-Predicates',
	#package : 'Scopeo-Predicates'
}

{ #category : 'target resize' }
ScpOr >> verify: aScpData [

	^ (left verify: aScpData) or: [
		  right verify: aScpData ]
]
