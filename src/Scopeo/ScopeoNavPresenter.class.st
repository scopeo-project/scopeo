Class {
	#name : #ScopeoNavPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'prevStmt',
		'nextStmt',
		'start',
		'end',
		'debugger'
	],
	#category : #'Scopeo-GUI'
}

{ #category : #layout }
ScopeoNavPresenter class >> defaultLayout [

	^ SpBoxLayout newHorizontal
		add: #prevStmt;
		add: #nextStmt;
		add: #start;
		add: #end;
		yourself 
]

{ #category : #accessing }
ScopeoNavPresenter >> debugger: aDebugger [

	debugger := aDebugger
]

{ #category : #initialization }
ScopeoNavPresenter >> initializePresenters [

	prevStmt := self newButton
		label: 'Prev. Statement';
		icon: (self iconNamed: #glamorousUp);
		action: [ self stepToPrevStatement ];
		yourself.
		
	nextStmt := self newButton
		label: 'Next. Statement';
		icon: (self iconNamed: #glamorousDown);
		action: [ self stepToNextStatement ];
		yourself.
	
	start := self newButton
		label: 'Start';
		icon: (self iconNamed: #smallHome);
		action: [ self stepToStart ];
		yourself.

	end := self newButton 
		label: 'End';
		icon: (self iconNamed: #glamorousSpawn);
		action: [ self stepToEnd ];
		yourself.
]

{ #category : #'debug - stepping' }
ScopeoNavPresenter >> stepToEnd [

	self tracer stepToEnd
]

{ #category : #'debug - stepping' }
ScopeoNavPresenter >> stepToNextStatement [
	
	self tracer perform advanceToNextStatement 
]

{ #category : #'debug - stepping' }
ScopeoNavPresenter >> stepToPrevStatement [
	
	self tracer perform reverseToPreviousStatement 
]

{ #category : #'debug - stepping' }
ScopeoNavPresenter >> stepToStart [

	self tracer timeTravelToUserStart
]

{ #category : #accessing }
ScopeoNavPresenter >> tracer [

	^ debugger debuggerActionModel tracer
]
