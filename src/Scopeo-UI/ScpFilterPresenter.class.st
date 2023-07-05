Class {
	#name : #ScpFilterPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'editor',
		'filter',
		'clear',
		'history',
		'onFilterDo'
	],
	#category : #'Scopeo-UI-Presenters'
}

{ #category : #action }
ScpFilterPresenter >> clear [

	editor text: String empty
]

{ #category : #layout }
ScpFilterPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  add: 'Filter' height: 20;
		  add: (SpBoxLayout newHorizontal
				   add: #clear;
				   add: #filter;
				   spacing: 10;
				yourself)
		  expand: false;
		  add: #editor expand: true;
		  yourself
]

{ #category : #action }
ScpFilterPresenter >> filter [

	onFilterDo cull: editor text 
]

{ #category : #initialization }
ScpFilterPresenter >> initializePresenters [

	editor := self newCode.
	editor syntaxHighlight: true.
	
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

{ #category : #accessing }
ScpFilterPresenter >> onFilterDo: aBlock [

	onFilterDo := aBlock
]
