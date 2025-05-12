Class {
	#name : 'ScpExplorationScopePresenter',
	#superclass : 'SpPresenterWithModel',
	#instVars : [
		'model',
		'objects',
		'traces',
		'objectsTracesPresenter',
		'objectsPresenter',
		'executionReferencePresenter',
		'referencesPresenter',
		'tracePresenterPlaceHolder',
		'tracePresenterPlaceholder',
		'tracePresenterLayout',
		'onSelectionBlock'
	],
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'initialization' }
ScpExplorationScopePresenter >> connectPresenters [

	objectsPresenter items: self model objects.
	
	objectsPresenter whenSelectedDo: [ :s |
		referencesPresenter items: (self model referencesFor: s)
	].
	
	referencesPresenter whenSelectedDo: [ :s | 		
		onSelectionBlock ifNotNil: [ :b | b cull: s ]
	]
	
]

{ #category : 'layout' }
ScpExplorationScopePresenter >> defaultLayout [

	^ SpPanedLayout newHorizontal
		add: objectsPresenter;
		add: referencesPresenter;
		yourself
]

{ #category : 'initialization' }
ScpExplorationScopePresenter >> initializePresenters [

	objectsPresenter := self newList
		headerTitle: 'Objects';
		yourself.

	referencesPresenter := self newList
		headerTitle: 'References in execution';
		yourself
]

{ #category : 'initialization' }
ScpExplorationScopePresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		title: self model label;
		initialExtent: 1000 @ 800
]

{ #category : 'enumerating' }
ScpExplorationScopePresenter >> whenSelectedDo: aBlock [

	onSelectionBlock := aBlock
]
