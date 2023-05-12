Class {
	#name : #ScopeoEventsPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'tabs',
		'list',
		'graph',
		'debugger',
		'steppingModel',
		'filter',
		'scope'
	],
	#category : #'Scopeo-UI-EventsPresenters'
}

{ #category : #initialization }
ScopeoEventsPresenter >> connectPresenters [

	filter onFilterDo: [ :p | 
		| objectsEvents |
		objectsEvents := StatesToObjectsEvents new 
			debuggerTracer: (steppingModel tracer);
			build; objectsEvents.
		self objectsEvents: (
			objectsEvents filter: (self evaluatePredicate: p) scope: scope
		).
	].

	graph onInteractionClickDo: [ :i | 
		steppingModel stepToBytecodeIndex: i bytecodeIndex
	].
]

{ #category : #layout }
ScopeoEventsPresenter >> defaultLayout [

	^ SpPanedLayout newVertical
		add: filter;
		add: tabs;
		positionOfSlider: 0.2
		yourself
]

{ #category : #evaluating }
ScopeoEventsPresenter >> evaluatePredicate: aPredicate [
	
	| context |
	
	context := steppingModel debugger currentContext.
   ^ context receiver class compiler
        source: aPredicate;
        context: context;
        receiver: context receiver;
        requestor: self;
        failBlock: [ nil ];
        evaluate.
]

{ #category : #initialization }
ScopeoEventsPresenter >> initializePresenters [

	filter := ScopeoFilterPresenter new.

	tabs := self newNotebook.
	
	list := ScopeoEventsListPresenter new.
	graph := ScopeoInteractionsPresenter new.

	tabs addPageTitle: 'Events list' provider: [ list ].
	tabs addPageTitle: 'Interactions graph' provider: [ graph ]
]

{ #category : #modifying }
ScopeoEventsPresenter >> objectsEvents: aObjectsEvents [

	list objectsEvents: aObjectsEvents.
	graph objectsInteractions: (
		ObjectsInteractions fromEvents: aObjectsEvents events
	).

]

{ #category : #accessing }
ScopeoEventsPresenter >> scope: aScope [
	
	scope := aScope.
	graph scope: aScope
]

{ #category : #accessing }
ScopeoEventsPresenter >> steppingModel: aSteppingModel [

	steppingModel := aSteppingModel.
	graph steppingModel: aSteppingModel.
]
