Class {
	#name : #ScopeoPresenter,
	#superclass : #SpPresenter,
	#traits : 'TStDebuggerExtension',
	#classTraits : 'TStDebuggerExtension classTrait',
	#instVars : [
		'nav',
		'scope',
		'query'
	],
	#category : #'Scopeo-UI-Presenters'
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

	scopeModel := ScpScope new.
	steppingModel := ScpSteppingModel new debugger: debugger.
	
	nav steppingModel: steppingModel.
	scopeObjects scope: scopeModel.
	scopeEvents scope: scopeModel.
	events scope: scopeModel; steppingModel: steppingModel.
]

{ #category : #initialization }
ScopeoPresenter >> initializePresenters [

	nav := ScpNavPresenter new.
	scopeObjects := ScpObjectsScopePresenter new.
	scopeEvents := ScpEventsScopePresenter new.
	events := ScpEventsPresenter new.
	self initializeModels.
]

{ #category : #accessing }
ScopeoPresenter >> scopeModel [

	^ scopeModel


]

{ #category : #accessing }
ScopeoPresenter >> steppingModel [

	^ steppingModel
]
