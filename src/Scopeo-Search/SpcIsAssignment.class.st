Class {
	#name : #SpcIsAssignment,
	#superclass : #ScpDataPredicate,
	#category : #'Scopeo-Search-Predicates'
}

{ #category : #verifying }
SpcIsAssignment >> verify: aScpData [

	^ aScpData isAssignment
	
]
