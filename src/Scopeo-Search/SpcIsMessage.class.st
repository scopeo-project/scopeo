Class {
	#name : #SpcIsMessage,
	#superclass : #ScpDataPredicate,
	#category : #'Scopeo-Search-Predicates'
}

{ #category : #verifying }
SpcIsMessage >> verify: aScpData [

	^ aScpData isMessage
]
