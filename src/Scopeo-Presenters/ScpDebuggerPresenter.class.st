Class {
	#name : 'ScpDebuggerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'model',
		'scopesListPresenters',
		'queryButtonPresenter'
	],
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'initialization' }
ScpDebuggerPresenter >> connectPresenters [

	scopesListPresenters items: model scopes.
	
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
 
	scopesListPresenters := self newList.
	
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
