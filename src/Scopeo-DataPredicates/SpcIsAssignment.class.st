Class {
	#name : #SpcIsAssignment,
	#superclass : #ScpDataPredicate,
	#category : #'Scopeo-DataPredicates'
}

{ #category : #verifying }
SpcIsAssignment >> verify: aScpData [

	^ aScpData isAssignment
	
]
