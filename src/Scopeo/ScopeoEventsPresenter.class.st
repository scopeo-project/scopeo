Class {
	#name : #ScopeoEventsPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'tabs',
		'list',
		'graph'
	],
	#category : #'Scopeo-GUI'
}

{ #category : #layout }
ScopeoEventsPresenter class >> defaultLayout [

	^ SpBoxLayout newVertical
		add: #tabs;
		yourself
]

{ #category : #initialization }
ScopeoEventsPresenter >> initializePresenters [

	tabs := self newNotebook.
		
	tabs addPageTitle: 'Events list' provider: [ ScopeoEventsListPresenter new ].
	tabs addPageTitle: 'Interactions graph' provider: [ ScopeoInteractionsPresenter new ]
]
