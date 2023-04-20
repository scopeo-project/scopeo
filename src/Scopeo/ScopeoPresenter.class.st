Class {
	#name : #ScopeoPresenter,
	#superclass : #SpPresenter,
	#traits : 'TStDebuggerExtension',
	#classTraits : 'TStDebuggerExtension classTrait',
	#instVars : [
		'nav',
		'scope',
		'filter',
		'events'
	],
	#category : #'Scopeo-GUI'
}

{ #category : #layout }
ScopeoPresenter class >> defaultLayout [

	^ SpBoxLayout newVertical
		add: #nav expand: false;
		add: #scope;
		add: #filter;
		add: #events;
		yourself
]

{ #category : #'debugger extension' }
ScopeoPresenter >> debuggerExtensionToolName [

	^ 'Scopeo'
]

{ #category : #initialization }
ScopeoPresenter >> initializePresenters [

	nav := ScopeoNavPresenter new 
		debugger: debugger;
		yourself.
	scope := ScopeoScopePresenter new.
	filter := ScopeoFilterPresenter new.
	events := ScopeoEventsPresenter new.
]
