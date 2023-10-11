Class {
	#name : #ScpAssignmentVariableNameEq,
	#superclass : #ScpUnaryPredicate,
	#category : #'Scopeo-Search-Predicates'
}

{ #category : #verifying }
ScpAssignmentVariableNameEq >> verify: aScpData [

	^ aScpData variable name == value
]
