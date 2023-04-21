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
		add: #scope height: 100;
		add: #filter height: 100;
		add: #events;
		yourself
]

{ #category : #initialization }
ScopeoPresenter >> connectPresenters [

	filter onFilterDo: [ :p | 
		| objectsEvents |
		objectsEvents := StatesToObjectsEvents new 
			debuggerTracer: (debugger debuggerActionModel tracer);
			build; objectsEvents.
		events objectsEvents: (
			objectsEvents filter: (self evaluatePredicate: p)
		).
	]
]

{ #category : #'debugger extension' }
ScopeoPresenter >> debuggerExtensionToolName [

	^ 'Scopeo'
]

{ #category : #evaluating }
ScopeoPresenter >> evaluatePredicate: aPredicate [
	
	| context |
	
	context := debugger currentContext.
   ^ context receiver class compiler
        source: aPredicate;
        context: context;
        receiver: context receiver;
        requestor: self;
        failBlock: [ nil ];
        evaluate.
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
