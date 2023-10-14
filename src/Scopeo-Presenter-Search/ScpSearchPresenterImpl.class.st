Class {
	#name : #ScpSearchPresenterImpl,
	#superclass : #Object,
	#traits : 'ScpSearchPresenter',
	#classTraits : 'ScpSearchPresenter classTrait',
	#instVars : [
		'codePane',
		'searchButton',
		'clearButton'
	],
	#category : #'Scopeo-Presenter-Search'
}

{ #category : #initialization }
ScpSearchPresenterImpl >> componentInitialize [

	spPresenter := SpPresenter new.

	codePane := SpCodePresenter new.
	codePane syntaxHighlight: true.

	searchButton := SpButtonPresenter new
		                label: 'Search';
		                action: [ self doSearch ];
		                yourself.
	clearButton := SpButtonPresenter new
		               label: 'Clear';
		               action: [ codePane text: String empty ];
		               yourself.

	spPresenter layout: (SpBoxLayout newVertical
			 add: 'Search query:' height: 15;
			 add: codePane expand: true;
			 add: (SpBoxLayout newHorizontal
					  add: clearButton;
					  add: searchButton;
					  spacing: 10;
					  yourself)
			 expand: false;
			 spacing: 8;
			 yourself)
]

{ #category : #action }
ScpSearchPresenterImpl >> doSearch [
	
	| sp text |
	sp := self get: ScpSearch.
	sp isNotFound ifTrue: [ ^ self ].
	
	text := codePane text asString.
	sp search: ((RBParser parseExpression: text) evaluate)
]

{ #category : #'scopeo - component lifecycle hooks' }
ScpSearchPresenterImpl >> starting [

	spPresenter := SpPresenter new.

	codePane := SpCodePresenter new.
	codePane syntaxHighlight: true.

	searchButton := SpButtonPresenter new
		                label: 'Search';
		                action: [ self doSearch ];
		                yourself.
	clearButton := SpButtonPresenter new
		               label: 'Clear';
		               action: [ codePane text: String empty ];
		               yourself.

	spPresenter layout: (SpBoxLayout newVertical
			 add: 'Search query:' height: 15;
			 add: codePane expand: true;
			 add: (SpBoxLayout newHorizontal
					  add: clearButton;
					  add: searchButton;
					  spacing: 10;
					  yourself)
			 expand: false;
			 spacing: 8;
			 yourself)
]

{ #category : #services }
ScpSearchPresenterImpl >> title [

	^ 'Scopeo - Search'
]
