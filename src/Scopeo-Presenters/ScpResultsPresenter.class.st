Class {
	#name : #ScpResultsPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'codePane',
		'events',
		'model',
		'addToScopeButton'
	],
	#category : 'Scopeo-Presenters'
}

{ #category : #initialization }
ScpResultsPresenter >> connectPresenters [

	events whenSelectionChangedDo: [ :selection |
		selection selectedIndexes ifNotEmpty: [ :ids | model selectedSearchResults: ids ].
		self updateCodePane: selection 
	].

	addToScopeButton action: [ model addSelectedSearchResultsToScope ].
	model bind: #searchResults to: [ :r | events items: r ]
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

{ #category : #'as yet unclassified' }
ScpResultsPresenter >> resolveMessageMethod: aMessage [

	^ aMessage sender class lookupSelector: aMessage senderSelector
]

{ #category : #'accessing - model' }
ScpResultsPresenter >> setModelBeforeInitialization: aDomainObject [

	model := aDomainObject
]

{ #category : #'as yet unclassified' }
ScpResultsPresenter >> updateCodePane: aSelection [

	| event |
	codePane text: String empty.
	aSelection selectedIndexes size ~~ 1 ifTrue: [ ^ self ].
	event := events items at: aSelection selectedIndexes first.

	event isMessage ifFalse: [ ^ self ].
	(self resolveMessageMethod: event) ifNotNil: [ :m |
		codePane text: m asString ]
]
