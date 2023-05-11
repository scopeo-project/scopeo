Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'nextPlayer',
		'message'
	],
	#category : #'Scopeo-Tests'
}

{ #category : #modifying }
Player >> hear: aMessage [

	| alphabet heardLetter |

	message := aMessage.

	Random new next < 0.2 ifFalse: [ ^ self ].
	alphabet := Character alphabet asUppercase asOrderedCollection.
	heardLetter := alphabet remove: aMessage first; atRandom.
	message := heardLetter asString, aMessage allButFirst
]

{ #category : #accessing }
Player >> message [

	^ message
]

{ #category : #modifying }
Player >> message: aMessage [

	^ message := aMessage
]

{ #category : #modifying }
Player >> nextPlayer [
	
	^ nextPlayer
]

{ #category : #modifying }
Player >> nextPlayer: aNextPlayer [

	nextPlayer := aNextPlayer.
]

{ #category : #messages }
Player >> whisper [

	nextPlayer ifNotNil: [
		nextPlayer hear: message.
		nextPlayer whisper.
	]
]
