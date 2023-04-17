Class {
	#name : #ScopeoPresenter,
	#superclass : #SpPresenter,
	#traits : 'TStDebuggerExtension',
	#classTraits : 'TStDebuggerExtension classTrait',
	#instVars : [
		'canvas',
		'toolbar',
		'scope',
		'editor',
		'chest'
	],
	#category : #'Scopeo-GUI'
}

{ #category : #layout }
ScopeoPresenter class >> defaultLayout [

	^ SpBoxLayout newVertical
		add: 'Step to' expand: false;
		add: #toolbar expand: false;
		add: 'Scope' expand: false;
		add: #scope expand: true;
		add: 'Filter' expand: false;
		add: #editor expand: true;
		add: #canvas;
		yourself
]

{ #category : #initialization }
ScopeoPresenter >> connectPresenters [

	
]

{ #category : #'debugger extension' }
ScopeoPresenter >> debuggerExtensionToolName [

	^ 'Scopeo'
]

{ #category : #'event handling' }
ScopeoPresenter >> eventUpdatedScope: aEvent [

	aEvent updatedChest = chest ifFalse: [ ^ self ].
	scope items: chest contents associations
]

{ #category : #initialization }
ScopeoPresenter >> initialize [

	super initialize.
	chest := Chest chestDictionary 
		at: 'Scopeo'
		ifAbsent: [ Chest newNamed: 'Scopeo' ].
	Chest announcer weak 
		when: ChestUpdated
		send: #eventUpdatedScope:
		to: self.
	chest contentsUpdated.

	
]

{ #category : #initialization }
ScopeoPresenter >> initializePresenters [

	self initializeToolbar.
	self initializeScope.
	
	editor := self newCode.
	editor syntaxHighlight: true.
	editor text: '(Type of: Player)'.
		
	canvas := self newRoassal.
]

{ #category : #initialization }
ScopeoPresenter >> initializeScope [

	scope := self newTable.
	scope
		addColumn: (SpStringTableColumn title: 'Name' evaluated: [ :item | item chestName asString ]);
		addColumn: (SpStringTableColumn title: 'Object' evaluated: [ :item | item chestEvaluation asString ]);
		beResizable.
]

{ #category : #initialization }
ScopeoPresenter >> initializeToolbar [

	toolbar := self newToolbar.
	
	toolbar add: (self newToolbarButton
		label: 'Next. Statement';
		icon: (self application iconNamed: #glamorousDown);
		action: [ self stepToNextStatement ];
		yourself).
	
	toolbar add: (self newToolbarButton
		label: 'Prev. Statement';
		icon: (self application iconNamed: #glamorousUp);
		action: [ self stepToPrevStatement ];
		yourself).
	
	toolbar add: (self newToolbarButton 
		label: 'Start';
		icon: (self application iconNamed: #smallHome);
		action: [ self stepToStart ];
		yourself).

	toolbar add: (self newToolbarButton 
		label: 'End';
		icon: (self application iconNamed: #glamorousSpawn);
		action: [ self stepToEnd ];
		yourself).
		
]

{ #category : #'debug - stepping' }
ScopeoPresenter >> stepToEnd [

	self tracer stepToEnd
]

{ #category : #'debug - stepping' }
ScopeoPresenter >> stepToNextStatement [
	
	self tracer perform advanceToNextStatement 
]

{ #category : #'debug - stepping' }
ScopeoPresenter >> stepToPrevStatement [
	
	self tracer perform reverseToPreviousStatement 
]

{ #category : #'debug - stepping' }
ScopeoPresenter >> stepToStart [

	self tracer timeTravelToUserStart
]

{ #category : #accessing }
ScopeoPresenter >> tracer [

	^ debugger debuggerActionModel tracer
]
