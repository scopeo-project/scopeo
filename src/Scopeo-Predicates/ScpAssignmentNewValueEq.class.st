Class {
	#name : 'ScpAssignmentNewValueEq',
	#superclass : 'ScpUnaryPredicate',
	#category : 'Scopeo-Predicates',
	#package : 'Scopeo-Predicates'
}

{ #category : 'verifying' }
ScpAssignmentNewValueEq >> verify: aScpData [

	^ aScpData newValue == value
]
