Class {
	#name : 'ScpIsStateUpdate',
	#superclass : 'ScpPredicate',
	#category : 'Scopeo-Predicates',
	#package : 'Scopeo-Predicates'
}

{ #category : 'verifying' }
ScpIsStateUpdate >> verify: aScpData [

	^ aScpData isStateUpdate
	
]
