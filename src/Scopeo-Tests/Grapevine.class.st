Class {
	#name : #Grapevine,
	#superclass : #Object,
	#instVars : [
		'players'
	],
	#category : #'Scopeo-Tests'
}

{ #category : #initialization }
Grapevine >> initialize [

	players := OrderedCollection new.
	players add: Player new.
	1 to: 9 do: [ :i | 
		players last nextPlayer: Player new.
		players add: players last nextPlayer
	]
]

{ #category : #initialization }
Grapevine >> play [

	| first last |
	
	first := players first.
	last := players last.
	
	first message: 'Hello world !'.
	first whisper.
	
	^ last message = first message.
]

{ #category : #accessing }
Grapevine >> players [

	^ players
]
