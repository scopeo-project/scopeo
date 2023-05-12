Class {
	#name : #ScopeoInteractionsPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'roassal',
		'steppingModel',
		'interactionClickBlock',
		'scopeObjects',
		'scopeEvents',
		'scope'
	],
	#classInstVars : [
		'aDebugger'
	],
	#category : #'Scopeo-UI-EventsPresenters'
}

{ #category : #adding }
ScopeoInteractionsPresenter >> addInteractionToScope: aInteraction [

	| name |
	name := aInteraction selector.
	name := UIManager default request: 'Event name' initialAnswer: name.
	scope putEvent: aInteraction named: name	

]

{ #category : #adding }
ScopeoInteractionsPresenter >> addObjectToScope: aObject [

	| name |
	name := aObject id.
	name := UIManager default request: 'Object name' initialAnswer: name.
	scope putObject: aObject named: name
]

{ #category : #layout }
ScopeoInteractionsPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		add: #roassal;
		yourself
]

{ #category : #initialization }
ScopeoInteractionsPresenter >> initializePresenters [

	roassal := self newRoassal
]

{ #category : #modifying }
ScopeoInteractionsPresenter >> objectsInteractions: aObjectsInteractions [

	roassal refresh.
	ObjectsInteractionsVisualization new
		objectsInteractions: aObjectsInteractions;
		addInteractionMenuEntry: 'Travel back to' do: [ :i | interactionClickBlock cull: i ]; 
		addInteractionMenuEntry: 'Store in debugging track' do: [ :i | self addInteractionToScope: i ]; 
		addObjectMenuEntry: 'Store in debugging scope' do: [ :o | self addObjectToScope: o ]; 
		renderIn: roassal canvas.

]

{ #category : #enumerating }
ScopeoInteractionsPresenter >> onInteractionClickDo: aBlock [

	interactionClickBlock := aBlock
]

{ #category : #accessing }
ScopeoInteractionsPresenter >> scope: aScope [

	scope := aScope
]

{ #category : #accessing }
ScopeoInteractionsPresenter >> steppingModel: aSteppingModel [

	steppingModel := aSteppingModel
]
