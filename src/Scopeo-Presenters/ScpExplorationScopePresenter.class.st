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
		'treePresenter',
		'referencesLabel'
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
		referencesLabel label: 'References in execution: ', referencesPresenter items size asString.
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
				referencesLabel label: 'References in execution: ',  items size asString, '/', size asString. 
			]
			ifEmpty: [ 
				referencesLabel label: 'References in execution:', size asString.
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
				add: referencesLabel expand: false; 
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

	referencesLabel := self newLabel.
	
	referencesPresenter := self newTable
		alternateRowsColor;
		addColumn: (SpStringTableColumn new  
			title: 'Timestamp'; 
			evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each timestamp ];
			beNotExpandable;
			width: 40;
			yourself);
		addColumn: (SpStringTableColumn new  
			title: 'Event'; 
			evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each ];
			yourself);		
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
