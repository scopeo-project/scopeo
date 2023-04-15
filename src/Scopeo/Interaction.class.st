Class {
	#name : #Interaction,
	#superclass : #ObjectEvent,
	#instVars : [
		'origin',
		'originId',
		'originMethod',
		'destination',
		'destinationId',
		'selector',
		'arguments'
	],
	#category : #'Scopeo-Model'
}

{ #category : #accessing }
Interaction >> arguments [

	^ arguments
]

{ #category : #accessing }
Interaction >> arguments: anObject [

	arguments := anObject
]

{ #category : #accessing }
Interaction >> destination [

	^ destination
]

{ #category : #accessing }
Interaction >> destination: anObject [

	destination := anObject
]

{ #category : #accessing }
Interaction >> destinationId [

	^ destinationId
]

{ #category : #accessing }
Interaction >> destinationId: anObject [

	destinationId := anObject
]

{ #category : #testing }
Interaction >> isInteraction [

	^ true
]

{ #category : #accessing }
Interaction >> origin [

	^ origin
]

{ #category : #accessing }
Interaction >> origin: anObject [

	origin := anObject
]

{ #category : #accessing }
Interaction >> originId [

	^ originId
]

{ #category : #accessing }
Interaction >> originId: anObject [

	originId := anObject
]

{ #category : #accessing }
Interaction >> originMethod [

	^ originMethod
]

{ #category : #accessing }
Interaction >> originMethod: anObject [

	originMethod := anObject
]

{ #category : #printing }
Interaction >> printOn: aStream [

	aStream 
		<< origin asString
		<< '(' << originId asString  << ')'
		<< ' sent "' << selector asString << '" to ' << destination asString
		<< '(' << destinationId asString  << ')'
]

{ #category : #accessing }
Interaction >> selector [

	^ selector
]

{ #category : #accessing }
Interaction >> selector: anObject [

	selector := anObject
]
