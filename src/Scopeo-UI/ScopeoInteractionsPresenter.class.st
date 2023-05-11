Class {
	#name : #ScopeoInteractionsPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'roassal',
		'steppingModel',
		'interactionClickBlock',
		'scopeObjects',
		'scopeEvents'
	],
	#classInstVars : [
		'aDebugger'
	],
	#category : #'Scopeo-UI-EventsPresenters'
}

{ #category : #adding }
ScopeoInteractionsPresenter >> addInteractionToScope: aInteraction [

	scopeEvents at: 'i', scopeEvents contents size asString put: aInteraction	

]

{ #category : #adding }
ScopeoInteractionsPresenter >> addObjectToScope: aObject [

	scopeObjects at: 'o', scopeObjects contents size asString put: aObject
]

{ #category : #layout }
ScopeoInteractionsPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		add: #roassal;
		yourself
]

{ #category : #initialization }
ScopeoInteractionsPresenter >> initialize [
	
	super initialize.
	scopeObjects := Chest chestDictionary 
		at: 'ScopeoObjects'
		ifAbsent: [ Chest newNamed: 'ScopeoObjects' ].
	scopeEvents := Chest chestDictionary 
		at: 'ScopeoEvents'
		ifAbsent: [ Chest newNamed: 'ScopeoEvents' ].
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
ScopeoInteractionsPresenter >> steppingModel: aSteppingModel [

	steppingModel := aSteppingModel
]
