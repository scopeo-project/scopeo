Class {
	#name : #ScpIsMessage,
	#superclass : #ScpPredicate,
	#category : #'Scopeo-Predicates'
}

{ #category : #verifying }
ScpIsMessage >> verify: aScpData [

	^ aScpData isMessage
]
