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
	#category : 'Scopeo-Presenters'
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
	results := ScpResultsPresenter on: model.
	
]

{ #category : #initialization }
ScopeoPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		title: 'Scopeo';
		initialExtent: 850 @ 650		
	"[
			 | w h |
			 w := Display width.
			 h := Display height.
			 w - (w // 3) @ (h - (h // 5)) ]
				 on: Error
				 do: [ 850 @ 650 ]"
]

{ #category : #initialization }
ScopeoPresenter >> setModelBeforeInitialization: aDomainObject [

	model := aDomainObject.
]

{ #category : #accessing }
ScopeoPresenter >> title [

	^ 'Scopeo'
]
