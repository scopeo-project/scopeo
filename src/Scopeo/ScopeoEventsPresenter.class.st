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

{ #category : #initialization }
ScopeoEventsPresenter >> initializePresenters [

	tabs := self newNotebook.
	
	list := self newNotebookPage.	
	graph := self newNotebookPage.
	
	tabs addPageTitle: 'Event list' provider: [ list ].
	tabs addPageTitle: 'Interactions graph' provider: [ graph ]
]
