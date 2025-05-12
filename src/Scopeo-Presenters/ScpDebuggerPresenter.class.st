Class {
	#name : 'ScpDebuggerPresenter',
	#superclass : 'SpPresenterWithModel',
	#instVars : [
		'model',
		'scopesListPresenters',
		'popover',
		'fullExecutionPresenter',
		'lowerPaneLayout',
		'questionButtonPresenter'
	],
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'initialization' }
ScpDebuggerPresenter >> connectPresenters [

	questionButtonPresenter action: [ 
		self showPopover: SpPopoverPosition bottom relativeTo: questionButtonPresenter
	].

	self model whenScopesUpdated: [ :scopes |
		scopesListPresenters items:	scopes		 
	].
		
	scopesListPresenters whenSelectedDo: [ :scope | 
		| presenter |
		
		presenter := scope presenter.
		presenter whenSelectedDo: [ :trace |
			fullExecutionPresenter selectTrace: trace.
		].
		lowerPaneLayout replaceFirst: presenter
	].

	scopesListPresenters items: self model scopes.
	
	fullExecutionPresenter whenSelectedDo: [ :trace |
		lowerPaneLayout replaceSecond: trace presenter		
	]

]

{ #category : 'layout' }
ScpDebuggerPresenter >> defaultLayout [

	^ SpPanedLayout newVertical
		positionOfSlider: 0.3;
		add: (	SpBoxLayout newVertical
			add: questionButtonPresenter expand: false;
			add: fullExecutionPresenter;
			yourself);
		add: (SpPanedLayout newVertical
			positionOfSlider: 0.2;
			add: scopesListPresenters;
			add: (lowerPaneLayout := SpPanedLayout newHorizontal
				add: (	SpBoxLayout newVertical
					vAlignCenter;
					hAlignCenter;
					add: 'No scope selected';
					yourself);
				add: (	SpBoxLayout newVertical
					vAlignCenter;
					hAlignCenter;
					add: 'No trace selected';
					yourself);
				yourself)
			yourself);
	yourself
	

	
]

{ #category : 'initialization' }
ScpDebuggerPresenter >> initializePresenters [

	fullExecutionPresenter := self model execution record presenter.

	questionButtonPresenter := self newButton
		label: 'Ask a new question';
		yourself.
 
	scopesListPresenters := self newList
		headerTitle: 'Exploration scopes';
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

{ #category : 'initialization' }
ScpDebuggerPresenter >> showPopover: aPosition relativeTo: aPresenter [

	popover ifNotNil: [ popover dismiss ].
	(popover := self newPopover)
		relativeTo: aPresenter;
		position: aPosition;
		presenter: (SpPresenter new
		
			layout: (SpBoxLayout newVertical
				add: (ScpQuestionWizardPresenter on: self model) withConstraints: [:constraints | 
					constraints width: 500.
					constraints height: 500
				];
				yourself);
			yourself);
		popup
]
