Class {
	#name : #ScpData,
	#superclass : #Object,
	#category : #'Scopeo-DataModel'
}

{ #category : #testing }
ScpData class >> isAbstract [

	^ self == ScpData
]

{ #category : #testing }
ScpData >> isAssignment [

	^ false
]

{ #category : #testing }
ScpData >> isMessage [

	^ false
]
