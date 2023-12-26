Class {
	#name : 'ScpTracesRecorderPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'onOffButton',
		'recordButton'
	],
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'instance creation' }
ScpTracesRecorderPresenter class >> open [

	^ (self newApplication: SpScopeoApplication new)
		  open;
		  yourself
]

{ #category : 'initialization' }
ScpTracesRecorderPresenter >> connectPresenters [

	onOffButton whenSwitchedOnDo: [
		recordButton enabled: true ].
	onOffButton whenSwitchedOffDo: [
		recordButton switchOff.
		recordButton enabled: false ]
]

{ #category : 'initialization' }
ScpTracesRecorderPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  add: onOffButton;
		  add: recordButton;
		  beHomogeneous;
		  yourself
]

{ #category : 'initialization' }
ScpTracesRecorderPresenter >> initializePresenters [

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
ScpTracesRecorderPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter title: 'Scopeo traces recorder'.
	aWindowPresenter initialExtent: 325 @ 115
]
