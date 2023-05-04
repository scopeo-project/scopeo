Class {
	#name : #ScopeoEventsPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'tabs',
		'list',
		'graph',
		'debugger',
		'steppingModel'
	],
	#category : #'Scopeo-GUI'
}

{ #category : #layout }
ScopeoEventsPresenter class >> defaultLayout [

	^ SpBoxLayout newVertical
		add: #tabs;
		yourself
]

{ #category : #initialization }
ScopeoEventsPresenter >> initializePresenters [

	tabs := self newNotebook.

	list := ScopeoEventsListPresenter new.
	graph := ScopeoInteractionsPresenter new
		onInteractionClickDo: [ :i | self travelToInteraction: i ]
		yourself.

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
ScopeoEventsPresenter >> steppingModel: aSteppingModel [

	steppingModel := aSteppingModel
]

{ #category : #'as yet unclassified' }
ScopeoEventsPresenter >> travelToInteraction: aInteraction [

	steppingModel stepToBytecodeIndex: aInteraction bytecodeIndex
]
