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
			yourself
		);
		yourself
]

{ #category : #initialization }
ScopeoPresenter >> initializePresenters [

	| model |
	
	model := ScopeoSteppingModel new
		debugger: debugger; 
		yourself.
		
	nav := ScopeoNavPresenter new 
		steppingModel: model;
		yourself.
			
	scopeObjects := ScopeoScopePresenter new
		title: 'Debugging scope objects';
		yourself.
	scopeEvents := ScopeoScopePresenter new
		title: 'Debugging scope events';
		yourself.
	
	events := ScopeoEventsPresenter new
		steppingModel: model;
		yourself.
	
]
