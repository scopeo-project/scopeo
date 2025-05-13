Class {
	#name : 'ScpStringSubjectPresenter',
	#superclass : 'ScpQuestionSubjectPresenter',
	#instVars : [
		'classListPresenter',
		'selectClassButton',
		'textFieldPresenter',
		'selectButton',
		'textInputPresenter'
	],
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'initialization' }
ScpStringSubjectPresenter >> connectPresenters [

	selectButton action: [
		textInputPresenter text ifNotEmpty: [ :t |
			onSelectedBlock ifNotNil: [ :block | block cull: t ]
		]
	].
]

{ #category : 'layout' }
ScpStringSubjectPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		add: 'Write a text in the following input or select one from the table below:' 
			withConstraints: [ :constraints |
					constraints expand: false.
					constraints padding: 5	
			];
		add: textInputPresenter;
		add: selectButton expand: false;
		yourself 
]

{ #category : 'initialization' }
ScpStringSubjectPresenter >> initializePresenters [

	textInputPresenter := self newTextInput
		placeholder: 'Enter a text'.
		
	selectButton := self newButton
		label: 'Select';
		yourself
]
