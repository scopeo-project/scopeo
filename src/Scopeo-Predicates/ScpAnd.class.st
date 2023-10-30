Class {
	#name : 'ScpAnd',
	#superclass : 'ScpBinaryPredicate',
	#category : 'Scopeo-Predicates',
	#package : 'Scopeo-Predicates'
}

{ #category : 'target resize' }
ScpAnd >> verify: aScpData [

	^ (left verify: aScpData) and: [
		  right verify: aScpData ]
]
