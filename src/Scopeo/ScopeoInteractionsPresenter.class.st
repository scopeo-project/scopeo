Class {
	#name : #ScopeoInteractionsPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'roassal'
	],
	#category : #'Scopeo-GUI'
}

{ #category : #layout }
ScopeoInteractionsPresenter class >> defaultLayout [

	^ SpBoxLayout newVertical
		add: #roassal;
		yourself
]

{ #category : #initialization }
ScopeoInteractionsPresenter >> initializePresenters [

	roassal := self newRoassal
]

{ #category : #modifying }
ScopeoInteractionsPresenter >> objectsInteractions: aObjectsInteractions [

	roassal refresh.
	ObjectsInteractionsVisualization new
		objectsInteractions: aObjectsInteractions;
		renderIn: roassal canvas.

]
