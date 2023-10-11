Class {
	#name : #ScpAssignmentObjectEq,
	#superclass : #ScpUnaryPredicate,
	#category : #'Scopeo-Search-Predicates'
}

{ #category : #verifying }
ScpAssignmentObjectEq >> verify: aScpData [

	^ aScpData object == value
]
