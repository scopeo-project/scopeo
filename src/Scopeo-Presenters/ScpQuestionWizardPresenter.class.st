Class {
	#name : 'ScpQuestionWizardPresenter',
	#superclass : 'SpPresenterWithModel',
	#instVars : [
		'nextButton',
		'backButton',
		'presenterActive',
		'steps',
		'presenterForQuestions',
		'presenterForSubjects',
		'question',
		'subjectSelection',
		'subjectsTablePresenter',
		'presenterForScopes',
		'answerButton',
		'buttonsLayout'
	],
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'layout' }
ScpQuestionWizardPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		add: self presenterForQuestions;
		add: (buttonsLayout := SpBoxLayout newHorizontal
			add: backButton;
			add: nextButton;
			spacing: 5;
			yourself) expand: false;
		yourself
]

{ #category : 'initialization' }
ScpQuestionWizardPresenter >> initializePresenters [

	backButton := self newButton
		label: 'Go back';
		yourself.
	
	nextButton := self newButton
		label: 'Continue';
		yourself.
		
	answerButton := self newButton
		label: 'Answer question';
		yourself.
]

{ #category : 'initialization' }
ScpQuestionWizardPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		title: 'Scopeo questions wizard';
		initialExtent: 500 @ 500
]

{ #category : 'as yet unclassified' }
ScpQuestionWizardPresenter >> presenterForQuestions [

	backButton enabled: false.
	nextButton enabled: presenterForQuestions isNotNil.

	presenterForQuestions ifNil: [ 
		| presenter |
		
		presenter := self newFilteringList
			matchSubstring;
			items: self model questions;
			whenSelectionChangedDo: [ :selection |
				question := selection selectedItem new.
				nextButton enabled: true
			];
			yourself.
		
		presenter listPresenter
			headerTitle: 'Questions';
			display: [ :q | q label ].

		presenterForQuestions := SpPresenter new
			layout: (SpBoxLayout newVertical
				add: 'Please select a question you have about the execution:' 
				withConstraints: [ :constraints |
					constraints expand: false.
					constraints padding: 5	
				];
				add: presenter);
			yourself.
	].

	nextButton action: [ 
		self layout replace: presenterForQuestions with: self presenterForSubjects 
	].

	^ presenterForQuestions 
	
]

{ #category : 'as yet unclassified' }
ScpQuestionWizardPresenter >> presenterForScopes [

	presenterForScopes ifNil: [
		| presenter |
		
		presenter := self newFilteringList
			matchSubstring;
			items: (self model scopes copy add: self model execution; yourself);
			whenSelectionChangedDo: [ :selection |
				question scope: selection selectedItem.
				answerButton enabled: true
			];
			yourself.
		
		presenter listPresenter
			headerTitle: 'Exploration scopes';
			display: [ :scope | scope label ].

		presenterForScopes := SpPresenter new
			layout: (SpBoxLayout newVertical
				add: 'Please select the scope from which to search objects answering your question' withConstraints: [ :constraints | 
					constraints expand: false.
					constraints padding: 5	
				];
				add: presenter;
				yourself);
			yourself
		
	].

	answerButton enabled: false.

	buttonsLayout replace: nextButton with: answerButton.
	
	backButton action: [ 
		self layout replace: presenterForScopes with: self presenterForSubjects.
		buttonsLayout replace: answerButton with: nextButton.
	].

	answerButton action: [ 
		self model addScope: question answer 
	].

	^ presenterForScopes
]

{ #category : 'as yet unclassified' }
ScpQuestionWizardPresenter >> presenterForSubjects [

	backButton enabled: true.
	
	presenterForSubjects ifNil: [ 
				
		presenterForSubjects := SpPresenter new
		layout: (SpBoxLayout newVertical
			spacing: 5;
			add: 'Select the object about which the question is asked' withConstraints: [ :constraints |
					constraints expand: false.
					constraints padding: 5	
			];
			add: (question class subjectSelectionPresenter: [ :subject |
				self model addSubject: subject.
				subjectsTablePresenter items: self model subjects.
				subjectsTablePresenter selection selectItem: subject
			]);
			add: (subjectsTablePresenter := self newTable
				alternateRowsColor;
				items: self model subjects;
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
				yourself);
			yourself);
		yourself.
			
		subjectsTablePresenter whenSelectedDo: [ :selection |
			question subject: selection.
			nextButton enabled: true.			
		]
	].

	nextButton enabled: subjectsTablePresenter selection isEmpty not.

	backButton action: [ 
		self layout replace: presenterForSubjects with: self presenterForQuestions 
	].
	nextButton action: [ 
		self layout replace: presenterForSubjects with: self presenterForScopes 
	].	
	
	^ presenterForSubjects
]
