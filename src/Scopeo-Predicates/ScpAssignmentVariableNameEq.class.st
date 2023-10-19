Class {
	#name : #ScpAssignmentVariableNameEq,
	#superclass : #ScpUnaryPredicate,
	#category : #'Scopeo-Predicates'
}

{ #category : #verifying }
ScpAssignmentVariableNameEq >> verify: aScpData [

	^ aScpData variable name == value
]
