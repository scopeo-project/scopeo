Class {
	#name : #ScpAssignmentObjectEq,
	#superclass : #ScpUnaryPredicate,
	#category : #'Scopeo-Predicates'
}

{ #category : #verifying }
ScpAssignmentObjectEq >> verify: aScpData [

	^ aScpData object == value
]
