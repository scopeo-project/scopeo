Class {
	#name : 'ScpAssignmentVariableNameEq',
	#superclass : 'ScpUnaryPredicate',
	#category : 'Scopeo-Predicates',
	#package : 'Scopeo-Predicates'
}

{ #category : 'verifying' }
ScpAssignmentVariableNameEq >> verify: aScpData [

	^ aScpData variable name == value
]
