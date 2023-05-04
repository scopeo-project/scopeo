Class {
	#name : #ScopeoInteractionsPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'roassal',
		'debugger',
		'track',
		'scope',
		'steppingModel',
		'interactionClickBlock'
	],
	#classInstVars : [
		'aDebugger'
	],
	#category : #'Scopeo-GUI'
}

{ #category : #layout }
ScopeoInteractionsPresenter class >> defaultLayout [

	^ SpBoxLayout newVertical
		add: #roassal;
		yourself
]

{ #category : #adding }
ScopeoInteractionsPresenter >> addInteractionToTrack: aInteraction [

	track at: 'i', track contents size asString put: aInteraction	

]

{ #category : #adding }
ScopeoInteractionsPresenter >> addObjectToScope: aObject [

	scope at: 'o', scope contents size asString put: aObject
]

{ #category : #initialization }
ScopeoInteractionsPresenter >> initialize [
	
	super initialize.
	scope := Chest chestDictionary 
		at: 'ScopeoObjects'
		ifAbsent: [ Chest newNamed: 'ScopeoObjects' ].
	track := Chest chestDictionary 
		at: 'ScopeoTrack'
		ifAbsent: [ Chest newNamed: 'ScopeoTrack' ].
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
		addInteractionMenuEntry: 'Store in debugging track' do: [ :i | self addInteractionToTrack: i ]; 
		addObjectMenuEntry: 'Store in debugging scope' do: [ :o | self addObjectToScope: o ]; 
		renderIn: roassal canvas.

]

{ #category : #enumerating }
ScopeoInteractionsPresenter >> onInteractionClickDo: aBlock [

	interactionClickBlock := aBlock
]

{ #category : #accessing }
ScopeoInteractionsPresenter >> steppingModel: aSteppingModel [

	steppingModel := aSteppingModel
]
