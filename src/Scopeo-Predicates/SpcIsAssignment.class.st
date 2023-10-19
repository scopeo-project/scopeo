Class {
	#name : #SpcIsAssignment,
	#superclass : #ScpPredicate,
	#category : #'Scopeo-Predicates'
}

{ #category : #verifying }
SpcIsAssignment >> verify: aScpData [

	^ aScpData isAssignment
	
]
