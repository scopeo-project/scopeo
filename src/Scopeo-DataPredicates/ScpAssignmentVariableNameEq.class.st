Class {
	#name : #ScpAssignmentVariableNameEq,
	#superclass : #ScpUnaryPredicate,
	#category : #'Scopeo-DataPredicates'
}

{ #category : #verifying }
ScpAssignmentVariableNameEq >> verify: aScpData [

	^ aScpData variable name == value
]
