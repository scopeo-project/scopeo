Class {
	#name : #ScopeoPresenter,
	#superclass : #SpPresenter,
	#traits : 'TStDebuggerExtension',
	#classTraits : 'TStDebuggerExtension classTrait',
	#instVars : [
		'nav',
		'scope',
		'filter',
		'events',
		'track',
		'scopeObjects',
		'scopeEvents'
	],
	#category : #'Scopeo-UI-MainPresenters'
}

{ #category : #'debugger extension' }
ScopeoPresenter >> debuggerExtensionToolName [

	^ 'Scopeo'
]

{ #category : #layout }
ScopeoPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		add: nav expand: false;
		add: (SpPanedLayout newVertical
			add: (SpPanedLayout newVertical
				add: scopeObjects;
				add: scopeEvents;
				yourself
			);
			add: events;
			positionOfSlider: 0.2
			yourself
		);
		yourself
]

{ #category : #initialization }
ScopeoPresenter >> initializeModels [

	| scopeModel steppingModel |
	
	scopeModel := ScopeoScopeModel new.
	steppingModel := ScopeoSteppingModel new debugger: debugger.
	
	nav steppingModel: steppingModel.
	scopeObjects scope: scopeModel.
	scopeEvents scope: scopeModel.
	events scope: scopeModel; steppingModel: steppingModel.
]

{ #category : #initialization }
ScopeoPresenter >> initializePresenters [

	nav := ScopeoNavPresenter new.
	scopeObjects := ScopeoObjectsScopePresenter new.
	scopeEvents := ScopeoEventsScopePresenter new.
	events := ScopeoEventsPresenter new.
	self initializeModels.
]
