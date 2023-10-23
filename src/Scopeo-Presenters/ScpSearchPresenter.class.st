Class {
	#name : #ScpSearchPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'searchButton',
		'clearButton',
		'codePane',
		'model'
	],
	#category : #'Scopeo-Presenters'
}

{ #category : #initialization }
ScpSearchPresenter >> connectPresenters [

	searchButton action: [ model search: codePane text ].
	clearButton action: [ codePane text: String empty ]. 
]

{ #category : #layout }
ScpSearchPresenter >> defaultLayout [ 

	^ SpBoxLayout newVertical
			 add: 'Search query:' height: 15;
			 add: codePane expand: true;
			 add: (SpBoxLayout newHorizontal
					  add: clearButton;
					  add: searchButton;
					  spacing: 10;
					  yourself)
			 expand: false;
			 spacing: 8;
			 yourself
]

{ #category : #initialization }
ScpSearchPresenter >> initializePresenters [

	codePane := self newCode
		syntaxHighlight: true;yourself

	.searchButton := self newButton
		                label: 'Search';
		                yourself.
	clearButton := self newButton
		               label: 'Clear';
		               yourself
]

{ #category : #'accessing - model' }
ScpSearchPresenter >> setModelBeforeInitialization: aDomainObject [

	model := aDomainObject 
]
