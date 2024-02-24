Class {
	#name : #ScpTraceRecorderPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'onOffButton',
		'recordButton',
		'sourceButton',
		'tracesButton',
		'model'
	],
	#category : #'Scopeo-TraceRecorder-Source-Recorder-UI'
}

{ #category : #'instance creation' }
ScpTraceRecorderPresenter class >> open [

	^ (self newApplication: SpScopeoApplication new)
		  open;
		  yourself
]

{ #category : #initialization }
ScpTraceRecorderPresenter >> connectPresenters [

	model announcer
		when: ScpTraceRecorderSourceEvent
		do: [ :e | onOffButton enabled: e source isNotNil ].

	onOffButton whenSwitchedOnDo: [
		model switchOn.
		recordButton enabled: true ].
	onOffButton whenSwitchedOffDo: [
		model switchOff.
		recordButton switchOff.
		recordButton enabled: false ].

	recordButton whenSwitchedOnDo: [ model startRecording ].
	recordButton whenSwitchedOffDo: [ model stopRecording ].

	sourceButton action: [ model source ].
	tracesButton action: [ model storage ]
]

{ #category : #initialization }
ScpTraceRecorderPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  add: sourceButton expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: onOffButton;
				   add: recordButton;
				   beHomogeneous;
				   spacing: 4;
				   yourself);
		  add: tracesButton expand: false;
		  spacing: 4; yourself
]

{ #category : #initialization }
ScpTraceRecorderPresenter >> initializePresenters [

	sourceButton := self newButton
		                label: 'Source';
		                yourself.

	onOffButton := ScpSwitchButtonPresenter new
		               switchedOnIcon: (self iconNamed: #switchedOn);
		               switchedOffIcon: (self iconNamed: #switchedOff);
		               switchedOnLabel: 'Scopeo on';
		               switchedOffLabel: 'Scopeo off';
		               switchOff;
		enabled: false;
		               yourself.

	recordButton := ScpSwitchButtonPresenter new
		                switchedOnIcon: (self iconNamed: #recording);
		                switchedOffIcon: (self iconNamed: #record);
		                switchedOnLabel: 'Recording traces';
		                switchedOffLabel: 'No traces';
		                switchOff;
		                enabled: false;
		                yourself.

	tracesButton := self newButton
		                label: 'Inspect traces';
		                yourself
]

{ #category : #initialization }
ScpTraceRecorderPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter title: 'Scopeo trace recorder'.
	aWindowPresenter initialExtent: 325 @ 175
]

{ #category : #'accessing - model' }
ScpTraceRecorderPresenter >> setModelBeforeInitialization: aModel [

	model := aModel
]
