Class {
	#name : #ScpEventsPresenter,
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

{ #category : #api }
ScpEventsPresenter >> addInteractionToScope: aInteraction [

	| name |
	name := aInteraction selector.
	name := UIManager default request: 'Event name' initialAnswer: name.
	name ifNil: [ ^ self ].
	
	scope putEvent: aInteraction named: name	

]

{ #category : #api }
ScpEventsPresenter >> addObjectToScope: aObject [

	| name |
	name := aObject id.
	name := UIManager default request: 'Object name' initialAnswer: name.
	name ifNil: [ ^ self ].
	
	scope putObject: aObject named: name
]

{ #category : #initialization }
ScpEventsPresenter >> connectPresenters [

	filter onFilterDo: [ :p |
		| objectsEvents |
		objectsEvents := ScpObjectsEventsExtractor new
			                 debuggerTracer: steppingModel tracer;
			                 build;
			                 objectsEvents.
		self objectsEvents:
			(objectsEvents filter: (self evaluatePredicate: p) scope: scope) ].
]

{ #category : #layout }
ScpEventsPresenter >> defaultLayout [

	^ SpPanedLayout newVertical
		  add: filter;
		  add: tabs;
		  positionOfSlider: 0.2;
		yourself
]

{ #category : #evaluating }
ScpEventsPresenter >> evaluatePredicate: aPredicate [
	
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
ScpEventsPresenter >> initializePresenters [

	filter := ScpFilterPresenter new.

	tabs := self newNotebook.
	
	list := ScpEventsListPresenter new.
	graph := ScpInteractionsPresenter new.

	tabs addPageTitle: 'Events list' provider: [ list ].
	tabs addPageTitle: 'Interactions graph' provider: [ graph ]
]

{ #category : #modifying }
ScpEventsPresenter >> objectsEvents: aObjectsEvents [

	list objectsEvents: aObjectsEvents.
	graph objectsInteractions: (
		ScpObjectsInteractions fromEvents: aObjectsEvents events
	).

]

{ #category : #accessing }
ScpEventsPresenter >> scope: aScope [

	scope := aScope
]

{ #category : #accessing }
ScpEventsPresenter >> steppingModel: aSteppingModel [

	steppingModel := aSteppingModel
]

{ #category : #api }
ScpEventsPresenter >> travelBackTo: aEvent [

	^ steppingModel stepToBytecodeIndex: aEvent bytecodeIndex
]
