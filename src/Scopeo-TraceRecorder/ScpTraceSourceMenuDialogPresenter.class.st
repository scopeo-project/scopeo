Class {
	#name : #ScpTraceSourceMenuDialogPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'label',
		'nameTextField',
		'okButton',
		'cancelButton',
		'model'
	],
	#category : #'Scopeo-TraceRecorder-Source-Menu-UI'
}

{ #category : #initialization }
ScpTraceSourceMenuDialogPresenter >> connectPresenters [

	model announcer
		when: ScpTraceSourceMenuDialogValidateEvent
		do: [ self window close ].
	model announcer
		when: ScpTraceSourceMenuDialogCancelEvent
		do: [ self window close ].

	nameTextField whenTextChangedDo: [ :t | model value: t ].

	okButton action: [ model validate ].
	cancelButton action: [ model cancel ]
]

{ #category : #layout }
ScpTraceSourceMenuDialogPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  add: 'Please provide a name for the trace source';
		  add: nameTextField expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: okButton;
				   add: cancelButton;
				   spacing: 4;
				   hAlignEnd;
				   yourself)
		  expand: false;
		  spacing: 4;
		  vAlignCenter;
		  yourself
]

{ #category : #initialization }
ScpTraceSourceMenuDialogPresenter >> initializePresenters [

	label := self newLabel
		         label: 'Please provide a name for the trace source';
		         yourself.
	nameTextField := self newTextInput
		                 placeholder: 'Example: my project name';
		                 yourself.
	okButton := self newButton
			         icon: ((self iconNamed: #validate) scaledToSize: 15 @ 15);
		            label: 'Validate';
		            yourself.
	cancelButton := self newButton
			         icon: ((self iconNamed: #cancel) scaledToSize: 15 @ 15);
		                label: 'Cancel';
		                yourself
]

{ #category : #initialization }
ScpTraceSourceMenuDialogPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter title: 'Scopeo source trace name'.
	aWindowPresenter initialExtent: 400 @ 110.
	aWindowPresenter whenClosedDo: [ model cancel ]
]

{ #category : #'accessing - model' }
ScpTraceSourceMenuDialogPresenter >> setModelBeforeInitialization: aModel [

	model := aModel
]
