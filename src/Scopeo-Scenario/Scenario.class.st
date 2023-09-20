Class {
	#name : #Scenario,
	#superclass : #Object,
	#instVars : [
		'players',
		'iterations'
	],
	#category : #'Scopeo-Scenario'
}

{ #category : #examples }
Scenario class >> example [

	self new
		iterations: 2;
		run
]

{ #category : #private }
Scenario >> addOneOrTwoPlayers [
	
	1 to: self oneOrTwo do: [ :i |
		players add: Player new.
	] 
]

{ #category : #initialization }
Scenario >> initialize [

	players := OrderedCollection new.
	10 timesRepeat: [ players add: Player new ]
]

{ #category : #accessing }
Scenario >> iterations: aNumberOfIterations [

	iterations := aNumberOfIterations
]

{ #category : #private }
Scenario >> oneOrTwo [

	^ #(1 2) atRandom
]

{ #category : #private }
Scenario >> removeOneOrTwoPlayers [

	1 to: self oneOrTwo do: [ :i | players removeFirst ]
]

{ #category : #running }
Scenario >> run [

	1 timesRepeat: [
		Grapevine new
			players: players;
			play.
		"self addOneOrTwoPlayers.
		self removeOneOrTwoPlayers.
		self shufflePlayers" ]
]

{ #category : #private }
Scenario >> shufflePlayers [

	players shuffle
]
