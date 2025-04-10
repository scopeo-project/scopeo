Class {
	#name : 'ScpExplorationScopePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'model',
		'objects',
		'traces',
		'executionRecordPresenter',
		'objectsTracesPresenter',
		'objectsPresenter',
		'executionReferencePresenter',
		'referencesPresenter',
		'tracePresenterPlaceHolder',
		'tracePresenterPlaceholder',
		'tracePresenterLayout'
	],
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'initialization' }
ScpExplorationScopePresenter >> connectPresenters [

	objectsPresenter items: model objects.
	
	objectsPresenter whenSelectedDo: [ :s |
		referencesPresenter items: { (model referencesFor: s) }	
	].

	executionRecordPresenter whenSelectedDo: [ :s |
		s ifNotNil: [
			referencesPresenter unselectAll.
			tracePresenterLayout replaceAtIndex: 1 with: s presenter.	
		]		
	].
	
	referencesPresenter whenSelectedDo: [ :s | 
		executionRecordPresenter selectTrace: s	
	]
	
]

{ #category : 'layout' }
ScpExplorationScopePresenter >> defaultLayout [

	tracePresenterLayout := SpBoxLayout newVertical
			add: tracePresenterPlaceholder;
			yourself.

	^ SpPanedLayout newVertical
		add: executionRecordPresenter;
		add: (SpPanedLayout newHorizontal
			add: (SpBoxLayout newHorizontal
				add: (SpBoxLayout newVertical 
					add: 'Objects' withConstraints: [ : constraints |
						constraints 
							expand: false;
							padding: 5 ];
					add: objectsPresenter; 
					yourself);
				add: (SpBoxLayout newVertical 
					add: 'References in execution' withConstraints: [ : constraints |
					constraints 
						expand: false;
						padding: 5 ]; 
					add: referencesPresenter; 
					yourself);
				yourself);
			add: tracePresenterLayout;
			yourself);
		positionOfSlider: 0.4;	
		yourself
]

{ #category : 'initialization' }
ScpExplorationScopePresenter >> initializePresenters [

	executionRecordPresenter := model record presenter.
	
	objectsPresenter := self newList.
	referencesPresenter := self newList.
	
	tracePresenterPlaceholder := SpPresenter new
		layout: (SpBoxLayout newVertical
			add: 'No trace selected';
			vAlignCenter;
			hAlignCenter;
			yourself
		);
		yourself
]

{ #category : 'initialization' }
ScpExplorationScopePresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		title: 'Exploration scope';
		initialExtent: 800 @ 500
]

{ #category : 'layout' }
ScpExplorationScopePresenter >> layoutForSelection: aSelection [

	^ SpPanedLayout newVertical
		add: executionRecordPresenter;
		add: (SpPanedLayout newHorizontal
			add: (SpBoxLayout newHorizontal
				add: (SpBoxLayout newVertical 
					add: 'Objects' withConstraints: [ : constraints |
						constraints 
							expand: false;
							padding: 5 ];
					add: objectsPresenter; 
					yourself);
				add: (SpBoxLayout newVertical 
					add: 'References in execution' withConstraints: [ : constraints |
					constraints 
						expand: false;
						padding: 5 ]; 
					add: referencesPresenter; 
					yourself);
				yourself);
			add: (aSelection
				ifNil: [ SpPresenter new
					layout: (SpBoxLayout newVertical
						add: 'No trace selected';
						vAlignCenter;
						hAlignCenter;
						yourself
					);
					yourself				
				] 
				ifNotNil: [ :s | s presenter ]
			);
			yourself);
		positionOfSlider: 0.4;	
		yourself
]

{ #category : 'accessing - model' }
ScpExplorationScopePresenter >> setModelBeforeInitialization: aDomainObject [

	model := aDomainObject
]
