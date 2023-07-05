Class {
	#name : #DemoTest,
	#superclass : #TestCase,
	#category : #'Scopeo-Tests'
}

{ #category : #tests }
DemoTest >> testGrapevine [

	| game isWon lastplayer |
	game := Grapevine new.
	isWon := game play.
	lastplayer := game players last.

	self assert: isWon
]
