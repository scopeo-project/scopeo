Class {
	#name : 'ScopeoTraceRecorderPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'onOffButton',
		'recordButton'
	],
	#category : 'Scopeo-TraceRecorder-Presenters',
	#package : 'Scopeo-TraceRecorder',
	#tag : 'Presenters'
}

{ #category : 'instance creation' }
ScopeoTraceRecorderPresenter class >> open [

	^ (self newApplication: SpScopeoApplication new)
		  open;
		  yourself
]

{ #category : 'initialization' }
ScopeoTraceRecorderPresenter >> connectPresenters [

	onOffButton whenSwitchedOnDo: [
		recordButton enabled: true ].
	onOffButton whenSwitchedOffDo: [
		recordButton switchOff.
		recordButton enabled: false ]
]

{ #category : 'initialization' }
ScopeoTraceRecorderPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  add: onOffButton;
		  add: recordButton;
		  beHomogeneous;
		  yourself
]

{ #category : 'initialization' }
ScopeoTraceRecorderPresenter >> initializePresenters [

	onOffButton := ScpSwitchButtonPresenter new
		               switchedOnIcon: (self iconNamed: #switchedOn);
		               switchedOffIcon: (self iconNamed: #switchedOff);
		               switchedOnLabel: 'Scopeo on';
		               switchedOffLabel: 'Scopeo off';
		               switchOff;
		               yourself.

	recordButton := ScpSwitchButtonPresenter new
		                switchedOnIcon: (self iconNamed: #recording);
		                switchedOffIcon: (self iconNamed: #record);
		                switchedOnLabel: 'Recording traces';
		                switchedOffLabel: 'No traces';
		                switchOff;
							 enabled: false;
		                yourself
]

{ #category : 'initialization' }
ScopeoTraceRecorderPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter title: 'Scopeo trace recorder'.
	aWindowPresenter initialExtent: 325 @ 115
]
