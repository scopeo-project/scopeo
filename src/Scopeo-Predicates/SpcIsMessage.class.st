Class {
	#name : #SpcIsMessage,
	#superclass : #ScpPredicate,
	#category : #'Scopeo-Predicates'
}

{ #category : #verifying }
SpcIsMessage >> verify: aScpData [

	^ aScpData isMessage
]
