Class {
	#name : 'ScpSwitchButtonPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'button',
		'label',
		'isOn',
		'switchedOnIcon',
		'switchedOffIcon',
		'switchedOnLabel',
		'switchedOffLabel',
		'whenSwitchedOnDoBlock',
		'whenSwitchedOffDoBlock'
	],
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'initialization' }
ScpSwitchButtonPresenter >> connectPresenters [

	button action: [
		self isOn
			ifTrue: [ self switchOff ]
			ifFalse: [ self switchOn ] ]
]

{ #category : 'initialization' }
ScpSwitchButtonPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  add: button;
		  add: (SpBoxLayout newVertical
				   add: label;
				   hAlignCenter;
				   yourself);
		  yourself
]

{ #category : 'initialization' }
ScpSwitchButtonPresenter >> initializePresenters [

	button := self newButton.
	label := self newLabel
]

{ #category : 'services' }
ScpSwitchButtonPresenter >> isOn [

	^ isOn ifNil: [ isOn := false ]
]

{ #category : 'services' }
ScpSwitchButtonPresenter >> switchOff [

	whenSwitchedOffDoBlock ifNotNil: [ :b | b value ].
	switchedOffIcon ifNotNil: [ :i | button icon: i ].
	switchedOffLabel ifNotNil: [ :l | label label: l ].
	isOn := false
]

{ #category : 'services' }
ScpSwitchButtonPresenter >> switchOn [

	whenSwitchedOnDoBlock ifNotNil: [ :b | b value ].
	switchedOnIcon ifNotNil: [ :i | button icon: i ].
	switchedOnLabel ifNotNil: [ :l | label label: l ].
	isOn := true
]

{ #category : 'parameters' }
ScpSwitchButtonPresenter >> switchedOffIcon: anIcon [

	switchedOffIcon := anIcon
]

{ #category : 'parameters' }
ScpSwitchButtonPresenter >> switchedOffLabel: aLabel [

	switchedOffLabel := aLabel
]

{ #category : 'parameters' }
ScpSwitchButtonPresenter >> switchedOnIcon: anIcon [

	switchedOnIcon := anIcon	
]

{ #category : 'parameters' }
ScpSwitchButtonPresenter >> switchedOnLabel: aLabel [

	switchedOnLabel := aLabel	
]

{ #category : 'parameters' }
ScpSwitchButtonPresenter >> whenSwitchedOffDo: aBlock [

	whenSwitchedOffDoBlock := aBlock
]

{ #category : 'parameters' }
ScpSwitchButtonPresenter >> whenSwitchedOnDo: aBlock [

	whenSwitchedOnDoBlock := aBlock
]
