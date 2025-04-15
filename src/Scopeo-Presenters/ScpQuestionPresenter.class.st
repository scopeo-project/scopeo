Class {
	#name : 'ScpQuestionPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'model',
		'questionsPresenter',
		'subjectsPresenter',
		'scopesPresenter',
		'addTargetPresenter',
		'askQuestionPresenter'
	],
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'initialization' }
ScpQuestionPresenter >> connectPresenters [

	questionsPresenter listPresenter items: model questions.
	scopesPresenter listPresenter items: model scopes
]

{ #category : 'layout' }
ScpQuestionPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		add: (SpPanedLayout newVertical
			add: questionsPresenter;
			add: (SpPanedLayout newVertical
				add: subjectsPresenter;
				add: scopesPresenter;
				positionOfSlider: 0.4;
				yourself);
			positionOfSlider: 0.35;
			yourself);
		add: (SpBoxLayout newHorizontal
			add: addTargetPresenter;
			add: askQuestionPresenter;
			yourself) expand: false;
		yourself
]

{ #category : 'initialization' }
ScpQuestionPresenter >> initializePresenters [

	questionsPresenter := self newFilteringList.
	questionsPresenter listPresenter
		headerTitle: 'Questions'.
		
	subjectsPresenter := self newTable
		addColumn: (SpStringTableColumn new  
			title: 'Object'; 
			evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each ];
			yourself);
		addColumn: (SpStringTableColumn new  
			title: 'Class'; 
			evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each class ];
			yourself);
		addColumn: (SpStringTableColumn new  
			title: 'Package'; 
			evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each class package ];
			yourself);
		yourself.
	
	scopesPresenter := self newFilteringList.
	scopesPresenter listPresenter
		headerTitle: 'Exploration scopes'.
	
	addTargetPresenter := self newButton 
		label: 'Add target';
		yourself.
	askQuestionPresenter := self newButton 
		label: 'Ask question';
		yourself.
]

{ #category : 'initialization' }
ScpQuestionPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		title: 'Scopeo questions';
		initialExtent: 500 @ 500
]

{ #category : 'accessing - model' }
ScpQuestionPresenter >> setModelBeforeInitialization: aDomainObject [

	model := aDomainObject
]
