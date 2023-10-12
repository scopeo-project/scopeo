Class {
	#name : #ScpSearchPresenterImpl,
	#superclass : #MolAbstractComponentImpl,
	#traits : 'ScpSearchPresenter + ScpSearchPresenterServices',
	#classTraits : 'ScpSearchPresenter classTrait + ScpSearchPresenterServices classTrait',
	#instVars : [
		'pane',
		'codePane',
		'searchButton',
		'presenter',
		'clearButton'
	],
	#category : #'Scopeo-Presenter-Search'
}

{ #category : #action }
ScpSearchPresenterImpl >> doSearch [
	
	| sp text |
	
	sp := self getScpSearchServicesProvider.
	sp isNotFoundServices ifTrue: [ ^ self ].
	
	text := codePane text asString.
	sp search: ((RBParser parseExpression: text) evaluate)
]

{ #category : #'component accessing' }
ScpSearchPresenterImpl >> getScpSearchServicesProvider [
	| servicesSymbol servicesProvider itf |

	itf := ScpSearchServices.
	servicesSymbol := self servicesProviders at: itf ifAbsent: [nil].
	(servicesSymbol isNil or:[servicesSymbol isSymbol not]) ifTrue: [ ^ MolNotFoundServicesProvider new interface: itf name: nil ].

	servicesProvider := MolComponentManager default locatorServices searchServicesProviderFor: ScpSearchServices named: servicesSymbol.
	^servicesProvider
]

{ #category : #initialization }
ScpSearchPresenterImpl >> initialize [

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

{ #category : #accessing }
ScpSearchPresenterImpl >> title [

	^ 'Scopeo - Search'
]
