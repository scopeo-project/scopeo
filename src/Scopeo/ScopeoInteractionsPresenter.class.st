Class {
	#name : #ScopeoInteractionsPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'canvas'
	],
	#category : #'Scopeo-GUI'
}

{ #category : #layout }
ScopeoInteractionsPresenter class >> defaultLayout [

	^ SpBoxLayout newVertical
		add: #canvas;
		yourself
]

{ #category : #initialization }
ScopeoInteractionsPresenter >> initializePresenters [

	canvas := self newRoassal
]
