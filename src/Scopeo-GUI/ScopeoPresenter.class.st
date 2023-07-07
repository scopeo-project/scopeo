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
	#category : #'Scopeo-GUI-Presenters'
}

{ #category : #'debugger extension' }
ScopeoPresenter >> debuggerExtensionToolName [

	^ 'Scopeo'
]

{ #category : #layout }
ScopeoPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		add: nav expand: false;
		add: scope;
		add: query;
		yourself
]

{ #category : #initialization }
ScopeoPresenter >> initializePresenters [

	nav := ScpNavPresenter new.
	scope := ScpScopePresenter new.
	query := ScpQueryPresenter new.	
]
