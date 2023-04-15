Class {
	#name : #ScopeoPresenter,
	#superclass : #SpPresenter,
	#traits : 'TStDebuggerExtension',
	#classTraits : 'TStDebuggerExtension classTrait',
	#instVars : [
		'objectsEvents',
		'tracer',
		'canvas',
		'toolbar',
		'scope',
		'editor'
	],
	#category : #'Scopeo-GUI'
}

{ #category : #layout }
ScopeoPresenter class >> defaultLayout [

	^ SpBoxLayout newVertical
		add: 'Step to' expand: false;
		add: #toolbar expand: false;
		add: 'Scope' expand: false;
		add: #scope expand: false;
		add: 'Filter' expand: false;
		add: #editor expand: false;
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

{ #category : #initialization }
ScopeoPresenter >> initializeModel [

	objectsEvents := StatesToObjectsEvents new 
		debuggerTracer: tracer; 
		build.
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
		addColumn: (SpStringTableColumn title: 'Name' evaluated: [ :item | item asString ]);
		addColumn: (SpStringTableColumn title: 'Object' evaluated: [ :item | item asString ]);
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

{ #category : #'as yet unclassified' }
ScopeoPresenter >> stepToNextStatement [
	
	self tracer perform advanceToNextStatement 
]

{ #category : #'as yet unclassified' }
ScopeoPresenter >> stepToPrevStatement [
	
	self tracer perform reverseToPreviousStatement 
]

{ #category : #starting }
ScopeoPresenter >> stepToStart [

	self tracer timeTravelToUserStart
]

{ #category : #accessing }
ScopeoPresenter >> tracer [

	^ debugger debuggerActionModel tracer
]
