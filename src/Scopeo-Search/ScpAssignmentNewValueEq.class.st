Class {
	#name : #ScpAssignmentNewValueEq,
	#superclass : #ScpUnaryPredicate,
	#category : #'Scopeo-Search-Predicates'
}

{ #category : #verifying }
ScpAssignmentNewValueEq >> verify: aScpData [

	^ aScpData newValue == value
]
