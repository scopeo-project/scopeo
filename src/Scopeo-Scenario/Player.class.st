Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'nextPlayer',
		'secret'
	],
	#category : #'Scopeo-Scenario'
}

{ #category : #modifying }
Player >> hear: aSecret [

	| alphabet heardLetter |
	secret := aSecret.

	Random new next < 0.2 ifFalse: [ ^ self ].
	alphabet := Character alphabet asUppercase asOrderedCollection.
	heardLetter := alphabet
		               remove: aSecret first;
		               atRandom.
	secret := heardLetter asString , aSecret allButFirst
]

{ #category : #modifying }
Player >> nextPlayer [
	
	^ nextPlayer
]

{ #category : #modifying }
Player >> nextPlayer: aNextPlayer [

	nextPlayer := aNextPlayer.
]

{ #category : #modifying }
Player >> secret [

	^ secret
]

{ #category : #modifying }
Player >> secret: aSecret [

	^ secret := aSecret
]

{ #category : #messages }
Player >> whisper [

	nextPlayer ifNotNil: [
		nextPlayer hear: secret "'Hello world !'".
		nextPlayer whisper ]
]
