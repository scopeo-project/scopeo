Class {
	#name : 'ScpAssignmentObjectEq',
	#superclass : 'ScpUnaryPredicate',
	#category : 'Scopeo-Predicates',
	#package : 'Scopeo-Predicates'
}

{ #category : 'verifying' }
ScpAssignmentObjectEq >> verify: aScpData [

	^ aScpData object == value
]
