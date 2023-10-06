Class {
	#name : #ScpAssignmentOldValueEq,
	#superclass : #ScpUnaryPredicate,
	#category : #'Scopeo-DataPredicates'
}

{ #category : #verifying }
ScpAssignmentOldValueEq >> verify: aScpData [

	^ aScpData oldValue == value
]
