Class {
	#name : #ScpAssignmentOldValueEq,
	#superclass : #ScpUnaryPredicate,
	#category : #'Scopeo-Predicates'
}

{ #category : #verifying }
ScpAssignmentOldValueEq >> verify: aScpData [

	^ aScpData oldValue == value
]
