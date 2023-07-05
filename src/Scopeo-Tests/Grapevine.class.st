Class {
	#name : #Grapevine,
	#superclass : #Object,
	#instVars : [
		'players'
	],
	#category : #'Scopeo-Tests'
}

{ #category : #initialization }
Grapevine >> play [

	| firstplayer lastplayer |
	firstplayer := players first.
	lastplayer := players last.

	firstplayer secret: 'Hello world !'.
	firstplayer whisper.

	^ firstplayer secret = lastplayer secret "'Jello world !'"
]

{ #category : #accessing }
Grapevine >> players [

	^ players
]

{ #category : #accessing }
Grapevine >> players: aPlayers [

	aPlayers size < 2 ifTrue: [
		self error: 'Grapevine cannot be played with less than 2 players.' ].
	2 to: aPlayers size do: [ :i |
		| previous current |
		previous := aPlayers at: i - 1.
		current := aPlayers at: i.
		previous nextPlayer: current ].
	players := aPlayers
]
