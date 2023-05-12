Class {
	#name : #ScpInteractionsPresenter,
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
ScpInteractionsPresenter >> addInteractionToScope: aInteraction [

	| name |
	name := aInteraction selector.
	name := UIManager default request: 'Event name' initialAnswer: name.
	name ifNil: [ ^ self ].
	
	scope putEvent: aInteraction named: name	

]

{ #category : #adding }
ScpInteractionsPresenter >> addObjectToScope: aObject [

	| name |
	name := aObject id.
	name := UIManager default request: 'Object name' initialAnswer: name.
	name ifNil: [ ^ self ].
	
	scope putObject: aObject named: name
]

{ #category : #layout }
ScpInteractionsPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		add: #roassal;
		yourself
]

{ #category : #initialization }
ScpInteractionsPresenter >> initializePresenters [

	roassal := self newRoassal
]

{ #category : #modifying }
ScpInteractionsPresenter >> objectsInteractions: aObjectsInteractions [

	roassal refresh.
	ScpInteractionsGraph new
		objectsInteractions: aObjectsInteractions;
		addInteractionMenuEntry: 'Travel back to' do: [ :i | interactionClickBlock cull: i ]; 
		addInteractionMenuEntry: 'Store in debugging track' do: [ :i | self addInteractionToScope: i ]; 
		addObjectMenuEntry: 'Store in debugging scope' do: [ :o | self addObjectToScope: o ]; 
		renderIn: roassal canvas.

]

{ #category : #enumerating }
ScpInteractionsPresenter >> onInteractionClickDo: aBlock [

	interactionClickBlock := aBlock
]

{ #category : #accessing }
ScpInteractionsPresenter >> scope: aScope [

	scope := aScope
]

{ #category : #accessing }
ScpInteractionsPresenter >> steppingModel: aSteppingModel [

	steppingModel := aSteppingModel
]
