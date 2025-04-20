Class {
	#name : 'ScpDebuggerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'model',
		'scopesListPresenters',
		'queryButtonPresenter',
		'popover'
	],
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'initialization' }
ScpDebuggerPresenter >> connectPresenters [

	queryButtonPresenter action: [ 
		self showPopover: SpPopoverPosition bottom relativeTo: queryButtonPresenter
	].

	model whenScopesUpdated: [ :scopes |
		scopesListPresenters items:	scopes		 
	].
	scopesListPresenters items:	model scopes.
	
	scopesListPresenters whenSelectedDo: [ :scope | 
		self layout replaceSecond: scope presenter	
	]
]

{ #category : 'layout' }
ScpDebuggerPresenter >> defaultLayout [

	^ SpPanedLayout newVertical
		add: (	SpBoxLayout newVertical
			add: queryButtonPresenter expand: false;
			add: 'Exploration scopes' withConstraints: [ :constraints | 
				constraints expand: false.
				constraints padding: 5 
			];
			add: scopesListPresenters;
			yourself);
		add: (	SpBoxLayout newVertical
			add: 'No scope selected';
			vAlignCenter;
			hAlignCenter;
			yourself);
		positionOfSlider: 0.2;
		yourself
	

]

{ #category : 'initialization' }
ScpDebuggerPresenter >> initializePresenters [

	queryButtonPresenter := self newButton
		label: 'Ask a new question';
		yourself.
 
	scopesListPresenters := self newList
		display: [ :scope | scope label ]
		yourself.
	
]

{ #category : 'initialization' }
ScpDebuggerPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		title: 'Scopeo debugger';
		initialExtent: 1000 @ 1000
]

{ #category : 'accessing - model' }
ScpDebuggerPresenter >> setModelBeforeInitialization: aDomainObject [

	model := aDomainObject
]

{ #category : 'initialization' }
ScpDebuggerPresenter >> showPopover: aPosition relativeTo: aPresenter [

	popover ifNotNil: [ popover dismiss ].
	(popover := self newPopover)
		relativeTo: aPresenter;
		position: aPosition;
		presenter: (SpPresenter new
		
			layout: (SpBoxLayout newVertical
				add: (ScpQuestionPresenter on: model) withConstraints: [:constraints | 
					constraints width: 500.
					constraints height: 500
				];
				yourself);
			yourself);
		popup
]
