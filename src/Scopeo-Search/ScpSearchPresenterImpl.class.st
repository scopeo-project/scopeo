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
	#category : #'Scopeo-Search-Presenter'
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

	presenter := SpPresenter new.

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

	presenter layout: (SpBoxLayout newVertical
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
ScpSearchPresenterImpl >> spPresenter [

	^ presenter
]

{ #category : #accessing }
ScpSearchPresenterImpl >> title [

	^ 'Scopeo - Search'
]
