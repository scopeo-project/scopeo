Class {
	#name : #ScpTraceSourceMenuPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'selections',
		'selectionList',
		'createButton',
		'editButton',
		'deleteButton',
		'cancelButton',
		'validateButton'
	],
	#category : #'Scopeo-TraceRecorder-Source-Menu-UI'
}

{ #category : #initialization }
ScpTraceSourceMenuPresenter >> connectPresenters [

	model announcer
		when: ScpTraceSourceMenuUpdateEvent
		send: #refresh
		to: self.

	model announcer
		when: ScpTraceSourceMenuValidateEvent
		do: [ self window close ].

	model announcer
		when: ScpTraceSourceMenuCancelEvent
		do: [ self window close ].

	selectionList whenSelectedDo: [ :s | model selection: s ].

	createButton action: [ model create ].
	editButton action: [ model edit ].
	deleteButton action: [ model delete ].

	validateButton action: [ model validate ].
	cancelButton action: [ model cancel ]
]

{ #category : #layout }
ScpTraceSourceMenuPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  add: selectionList;
		  add: (SpBoxLayout newHorizontal
				   add: createButton;
				   add: editButton;
				   add: deleteButton;
				   spacing: 4;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: validateButton width: 150;
				   add: cancelButton;
						  spacing: 4;
				   hAlignEnd;
				   yourself)
		  expand: false;
		  spacing: 4;
		  yourself
]

{ #category : #initialization }
ScpTraceSourceMenuPresenter >> initializePresenters [

	selectionList := self newList.
	selectionList headerTitle: 'Trace source selections'.

	createButton := self newButton
		                icon:
			                ((self iconNamed: #create) scaledToSize: 15 @ 15);
		                label: 'Create';
		                yourself.
	editButton := self newButton
		              icon: ((self iconNamed: #edit) scaledToSize: 15 @ 15);
		              label: 'Edit';
		              yourself.
	deleteButton := self newButton
		                icon:
			                ((self iconNamed: #glamorousTrash) scaledToSize:
					                 15 @ 15);
		                label: 'Delete';
		                yourself.
	validateButton := self newButton
		                icon:
			                ((self iconNamed: #validate) scaledToSize: 15 @ 15);
		                label: 'Validate selection';
		                yourself.
	cancelButton := self newButton
		                icon:
			                ((self iconNamed: #cancel) scaledToSize: 15 @ 15);
		                label: 'Cancel';
		                yourself.
	self refresh
]

{ #category : #initialization }
ScpTraceSourceMenuPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter title: 'Scopeo trace source menu'.
	aWindowPresenter initialExtent: 400 @ 400.
	aWindowPresenter whenClosedDo: [ model cancel ]
]

{ #category : #accessing }
ScpTraceSourceMenuPresenter >> refresh [

	selectionList items: model selections
]

{ #category : #'accessing - model' }
ScpTraceSourceMenuPresenter >> setModelBeforeInitialization: aModel [

	model := aModel
]
