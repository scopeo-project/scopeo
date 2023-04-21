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

	list := ScopeoEventsListPresenter new.
	graph := ScopeoInteractionsPresenter new.

	tabs addPageTitle: 'Events list' provider: [ list ].
	tabs addPageTitle: 'Interactions graph' provider: [ graph ]
]

{ #category : #modifying }
ScopeoEventsPresenter >> objectsEvents: aObjectsEvents [

	list objectsEvents: aObjectsEvents.
	graph objectsInteractions: (
		ObjectsInteractions fromEvents: aObjectsEvents events
	).

]
