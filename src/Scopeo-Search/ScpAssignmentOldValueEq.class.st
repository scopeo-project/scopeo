Class {
	#name : #ScpAssignmentOldValueEq,
	#superclass : #ScpUnaryPredicate,
	#category : #'Scopeo-Search-Predicates'
}

{ #category : #verifying }
ScpAssignmentOldValueEq >> verify: aScpData [

	^ aScpData oldValue == value
]
