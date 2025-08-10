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
		'onSelectionBlock',
		'referencesFilter',
		'treePresenter'
	],
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'initialization' }
ScpExplorationScopePresenter >> connectPresenters [

	| selectedObject navigatingTraces |

	navigatingTraces := false.

	objectsPresenter items: self model objects.
	
	objectsPresenter whenSelectedDo: [ :s |
		
		selectedObject := s.
		referencesPresenter items: (self model referencesFor: s).
		referencesPresenter headerTitle: 'References in execution: ', referencesPresenter items size asString.
	].
	
	treePresenter whenSelectedDo: [ :s | 
		navigatingTraces ifFalse: [ 	
			onSelectionBlock ifNotNil: [ :b | b cull: s ]
		]
	].
	
	referencesPresenter whenSelectedDo: [ :s | 		
		navigatingTraces := true.
		treePresenter selectTrace: s.
		navigatingTraces := false.
		
		onSelectionBlock ifNotNil: [ :b | b cull: s ].
	].

	referencesFilter whenTextChangedDo: [ :filter | 
		| items size |
		
		items := (self model referencesFor: selectedObject).
		size := items size.
		 
		filter asString 
			ifNotEmpty: [ 
				items := items select: [ :r | r matchesFilter: filter asString ].
				referencesPresenter headerTitle: 'References in execution: ',  items size asString, '/', size asString. 
			]
			ifEmpty: [ 
				referencesPresenter headerTitle: 'References in execution:', size asString.
			].
		
		referencesPresenter items: items
	]
	
]

{ #category : 'layout' }
ScpExplorationScopePresenter >> defaultLayout [

	^ SpPanedLayout newVertical
		add: treePresenter;
		add: (SpPanedLayout newHorizontal
			add: objectsPresenter;
			add: ( SpBoxLayout newVertical 
				add: referencesPresenter;
				add: referencesFilter expand: false;
				yourself);
			positionOfSlider: 0.3;
			yourself);
		positionOfSlider: 0.6;
		yourself
]

{ #category : 'initialization' }
ScpExplorationScopePresenter >> initializePresenters [

	treePresenter := self model record presenter.
	
	objectsPresenter := self newList
		headerTitle: 'Objects';
		yourself.

	referencesPresenter := self newList
		sortingBlock: #timestamp ascending;
		yourself.

	referencesFilter := self newTextInput
		placeholder: 'Type to filter';
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
