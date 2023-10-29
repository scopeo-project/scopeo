Class {
	#name : #ScpDataModel,
	#superclass : #Object,
	#category : 'Scopeo-Data'
}

{ #category : #testing }
ScpDataModel class >> isAbstract [

	^ self == ScpDataModel
]

{ #category : #testing }
ScpDataModel >> isMessage [

	^ false
]

{ #category : #testing }
ScpDataModel >> isStateUpdate [

	^ false
]
