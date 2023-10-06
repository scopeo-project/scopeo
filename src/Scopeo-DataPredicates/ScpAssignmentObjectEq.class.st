Class {
	#name : #ScpAssignmentObjectEq,
	#superclass : #ScpUnaryPredicate,
	#category : #'Scopeo-DataPredicates'
}

{ #category : #verifying }
ScpAssignmentObjectEq >> verify: aScpData [

	^ aScpData object == value
]
