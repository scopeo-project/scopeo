Class {
	#name : #ScopeoFilterPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'editor',
		'filter',
		'clear',
		'history'
	],
	#category : #'Scopeo-GUI'
}

{ #category : #layout }
ScopeoFilterPresenter class >> defaultLayout [

	^ SpBoxLayout newVertical
		add: 'Filter' height: 20;
		add: (SpBoxLayout newHorizontal
			add: #clear;
			add: #filter;
			spacing: 10
			yourself) expand: false;
		add: #editor expand: true;
		yourself
]

{ #category : #action }
ScopeoFilterPresenter >> clear [

	editor text: String empty
]

{ #category : #action }
ScopeoFilterPresenter >> filter [

]

{ #category : #initialization }
ScopeoFilterPresenter >> initializePresenters [

	editor := self newCode.
	editor syntaxHighlight: true.
	editor text: '(Type of: Player)'.
	
	clear := self newButton 
		label: 'Clear'; 
		action: [ self clear];
		yourself.
	filter := self newButton 
		label: 'Filter';
		action: [ self filter ]
		yourself.
	history := self newButton
		label: 'History';
		yourself.
]
