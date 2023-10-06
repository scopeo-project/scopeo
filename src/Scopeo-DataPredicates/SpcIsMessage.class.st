Class {
	#name : #SpcIsMessage,
	#superclass : #ScpDataPredicate,
	#category : #'Scopeo-DataPredicates'
}

{ #category : #verifying }
SpcIsMessage >> verify: aScpData [

	^ aScpData isMessage
]
