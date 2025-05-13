Class {
	#name : 'ScpClassSubjectPresenter',
	#superclass : 'ScpQuestionSubjectPresenter',
	#instVars : [
		'classListPresenter',
		'selectClassButton',
		'textInputPresenter'
	],
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'initialization' }
ScpClassSubjectPresenter >> connectPresenters [

	selectClassButton action: [ 
		classListPresenter listPresenter selection selectedItem 
			ifNotNil: [ :class |
				onSelectedBlock cull: class
			] 
	].

	classListPresenter items: Smalltalk allClasses
]

{ #category : 'layout' }
ScpClassSubjectPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		add: 'Select a class from the following list or from the table below:' 
			withConstraints: [ :constraints |
					constraints expand: false.
					constraints padding: 5	
			];
		add: classListPresenter;
		add: selectClassButton expand: false;
		yourself 
]

{ #category : 'initialization' }
ScpClassSubjectPresenter >> initializePresenters [

	classListPresenter := self newFilteringList.
	classListPresenter listPresenter
		headerTitle: 'Classes';
		displayIcon: [ self iconNamed: #class ].
		
	selectClassButton := self newButton
		label: 'Select';
		yourself
]
