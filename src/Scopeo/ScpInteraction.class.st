Class {
	#name : #ScpInteraction,
	#superclass : #ScpObjectEvent,
	#instVars : [
		'origin',
		'originId',
		'originMethod',
		'destination',
		'destinationId',
		'selector',
		'arguments'
	],
	#category : #'Scopeo-Entities'
}

{ #category : #accessing }
ScpInteraction >> arguments [

	^ arguments
]

{ #category : #accessing }
ScpInteraction >> arguments: anObject [

	arguments := anObject
]

{ #category : #accessing }
ScpInteraction >> destination [

	^ destination
]

{ #category : #accessing }
ScpInteraction >> destination: anObject [

	destination := anObject
]

{ #category : #testing }
ScpInteraction >> isInteraction [

	^ true
]

{ #category : #accessing }
ScpInteraction >> origin [

	^ origin
]

{ #category : #accessing }
ScpInteraction >> origin: anObject [

	origin := anObject
]

{ #category : #printing }
ScpInteraction >> printOn: aStream [

	aStream 
		<< origin asString
		<< ' sent "' << selector asString 
		<< '" to ' << destination asString

]

{ #category : #accessing }
ScpInteraction >> selector [

	^ selector
]

{ #category : #accessing }
ScpInteraction >> selector: anObject [

	selector := anObject
]
