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
		'buttonsLayout',
		'contextMenuGroup'
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

	self flag: 'Horribly dirty'.
	
	backButton enabled: false.
	nextButton enabled: false.

	nextButton action: [ 
		self layout replaceAtIndex: 1 with: (question hasSubject 
			ifTrue: [ self presenterForSubjects ] 
			ifFalse: [ self presenterForScopes ]
		).
		backButton enabled: true.
		backButton action: [ 
			self layout replaceAtIndex: 1 with: self presenterForQuestions.
			buttonsLayout replaceAtIndex: 2 with: nextButton.	
			nextButton enabled: true.			
		]
	].

	presenterForQuestions ifNil: [ 
		| presenter |
		
		presenter := self newFilteringList
			matchSubstring;
			items: self model questions;
			whenSelectionChangedDo: [ :selection |
				
				selection selectedItem ifNotNil: [ :i |
					question := selection selectedItem new.
					nextButton enabled: true.	
				]					
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

	^ presenterForQuestions 
	
]

{ #category : 'as yet unclassified' }
ScpQuestionWizardPresenter >> presenterForScopes [

	self flag: 'Horribly dirty'.
	
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
	
	answerButton action: [ 
		self model addScope: question answer 
	].

	^ presenterForScopes
]

{ #category : 'as yet unclassified' }
ScpQuestionWizardPresenter >> presenterForSubjects [

	self flag: 'Horribly dirty'.

	presenterForSubjects ifNil: [ 
				
		| presenterLayout |
				
		presenterLayout := SpBoxLayout newVertical
			spacing: 5;
			yourself.
		question class hasSubjectSelectionPresenter ifTrue: [ 
			presenterLayout add: (question class subjectSelectionPresenter: [ :subject |
				self model addSubject: subject.
				subjectsTablePresenter items: self model subjects.
				subjectsTablePresenter selection selectItem: subject
			]).
		].
		
		presenterLayout 
			add: 'Select the subject of the question:' withConstraints: [ :constraints |
					constraints expand: false.
					constraints padding: 5	
			];
			add: (subjectsTablePresenter := self newTable
				alternateRowsColor;
				items: self model subjects;
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
				contextMenu: (SpMenuPresenter new
				addGroup: [ :group | 
					contextMenuGroup := group.
					contextMenuGroup addItem: [ :item | 
						item name: 'Remove'; 
						action: [ self model subjects remove: subjectsTablePresenter selectedItem  ] 
					]
				]);
				yourself).
				
		presenterForSubjects := SpPresenter new
		layout: presenterLayout;
		yourself.
			
		subjectsTablePresenter whenSelectedDo: [ :selection |
			question subject: selection.
			nextButton enabled: true.			
		]
	].

	nextButton enabled: subjectsTablePresenter selection isEmpty not.
	nextButton action: [ 
		self layout replaceAtIndex: 1 with: self presenterForScopes.
		backButton action: [ 
			self layout replaceAtIndex: 1 with: self presenterForSubjects.
			buttonsLayout replaceAtIndex: 2 with: nextButton.
			
			backButton action: [
				self layout replaceAtIndex: 1 with: self presenterForQuestions.
				nextButton enabled: true
			]
		]. 
	].
	
	^ presenterForSubjects
]
