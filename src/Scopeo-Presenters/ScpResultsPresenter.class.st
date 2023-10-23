Class {
	#name : #ScpResultsPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'codePane',
		'events',
		'model',
		'addToScopeButton'
	],
	#category : #'Scopeo-Presenters'
}

{ #category : #initialization }
ScpResultsPresenter >> connectPresenters [

	events whenSelectionChangedDo: [ :selection |
		model selectedSearchResults: selection.
		selection size < 2 ifTrue: [
			codePane beForMethod:
				selection sender class << selection senderSelector ] ].
		
	addToScopeButton action: [ model addSelectedSearchResultsToScope ]
]

{ #category : #'life cycle' }
ScpResultsPresenter >> defaultLayout [

	^ SpPanedLayout newHorizontal
		  add: (SpBoxLayout newVertical
				   add: 'Results' height: 15;
				   add: events;
				   add: addToScopeButton expand: false;
				   spacing: 8;
				   yourself);
		  add: (SpBoxLayout newVertical
				   add: 'Method from selected result' height: 15;
				   add: codePane;
					spacing: 8;
				   yourself);
		  yourself
]

{ #category : #'life cycle' }
ScpResultsPresenter >> initializePresenters [

	events := self newList
		          beMultipleSelection;
		          yourself.
	codePane := self newCode
		            syntaxHighlight: true;
		            yourself.
		
	addToScopeButton := self newButton label: 'Add to scope'; yourself.
]

{ #category : #'accessing - model' }
ScpResultsPresenter >> setModelBeforeInitialization: aDomainObject [

	model := aDomainObject
]
