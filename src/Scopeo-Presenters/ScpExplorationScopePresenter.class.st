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
		'referencesFilter'
	],
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'initialization' }
ScpExplorationScopePresenter >> connectPresenters [

	| selectedObject |

	objectsPresenter items: self model objects.
	
	objectsPresenter whenSelectedDo: [ :s |
		
		selectedObject := s.
		referencesPresenter items: (self model referencesFor: s)
	].
	
	referencesPresenter whenSelectedDo: [ :s | 		
		onSelectionBlock ifNotNil: [ :b | b cull: s ]
	].

	referencesFilter whenTextChangedDo: [ :filter | 
		| items |
		
		items := (self model referencesFor: selectedObject).
		 
		filter asString ifNotEmpty: [ 
			items := items select: [ :r | r matchesFilter: filter asString ]  
		].
		
		referencesPresenter items: items
	]
	
]

{ #category : 'layout' }
ScpExplorationScopePresenter >> defaultLayout [

	^ SpPanedLayout newHorizontal
		add: objectsPresenter;
		add: ( SpBoxLayout newVertical 
			add: referencesPresenter;
			add: referencesFilter expand: false;
			yourself);
		yourself
]

{ #category : 'initialization' }
ScpExplorationScopePresenter >> initializePresenters [

	objectsPresenter := self newList
		headerTitle: 'Objects';
		yourself.

	referencesPresenter := self newList
		headerTitle: 'References in execution';
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
