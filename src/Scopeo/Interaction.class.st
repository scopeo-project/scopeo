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
	#category : #'Scopeo-ObjectsEventsModel'
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
		<< ' sent "' << selector asString 
		<< '" to ' << destination asString

]

{ #category : #accessing }
Interaction >> selector [

	^ selector
]

{ #category : #accessing }
Interaction >> selector: anObject [

	selector := anObject
]
