Class {
	#name : #ScopeoPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'presenter',
		'model',
		'scope',
		'search',
		'results'
	],
	#category : #'Scopeo-Presenters'
}

{ #category : #layout }
ScopeoPresenter >> defaultLayout [

	^ SpPanedLayout newVertical
		  add: (SpPanedLayout newHorizontal
				   add: scope;
				   add: search;
				   yourself);
		  add: results;
		  yourself
]

{ #category : #initialization }
ScopeoPresenter >> initializePresenters [

	scope := ScpScopePresenter on: model.
	search := ScpSearchPresenter on: model.
	results := ScpResultsPresenter on: model
]

{ #category : #initialization }
ScopeoPresenter >> setModelBeforeInitialization: aDomainObject [

	model := aDomainObject.
]

{ #category : #TOREMOVE }
ScopeoPresenter >> title [

	^ 'Scopeo'
]
