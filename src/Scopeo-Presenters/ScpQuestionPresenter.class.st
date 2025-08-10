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
	scopesPresenter listPresenter items: model scopes.
	
	subjectsPresenter items: model subjects.
		
	addTargetPresenter action: [ 
		questionsPresenter listPresenter selection selectedItem 
			ifNil: [ 
				SpInformDialog new 
					title: 'No question selected';
					label: 'Please select a question before adding a compatible target!';
					acceptLabel: 'Ok, will do!';
					openModal 
			]
			ifNotNil: [ :question |
				question openSubjectSelectionPresenter: [ :subject |
					subjectsPresenter items add: subject
				
				]
			]
	].	
	
	askQuestionPresenter action: [
		(subjectsPresenter selection selectedItem isNil or: [scopesPresenter listPresenter selection selectedItem isNil ])
			ifTrue: [ 
				SpInformDialog new 
					title: 'No subject or scope selected';
					label: 'Please select a subject and a scope before asking the question!';
					acceptLabel: 'Ok, will do!';
					openModal 
			]
			ifFalse: [ 
				model addScope: (questionsPresenter listPresenter selection selectedItem new
					subject: subjectsPresenter selection selectedItem;
					scope: scopesPresenter listPresenter selection selectedItem;
					answer)
			]
		]
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
		headerTitle: 'Questions';
		display: [ :question | question label ].
		
	subjectsPresenter := self newTable
		addColumn: (SpStringTableColumn new  
			title: 'Hash'; 
			evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each hash ];
			yourself);
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
		headerTitle: 'Exploration scopes';
		display: [ :scope | scope label ].
	
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
