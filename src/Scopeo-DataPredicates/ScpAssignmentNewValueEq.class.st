Class {
	#name : #ScpAssignmentNewValueEq,
	#superclass : #ScpUnaryPredicate,
	#category : #'Scopeo-DataPredicates'
}

{ #category : #verifying }
ScpAssignmentNewValueEq >> verify: aScpData [

	^ aScpData newValue == value
]
