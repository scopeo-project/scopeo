Class {
	#name : #ScpInteractionsPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'roassal',
		'steppingModel',
		'interactionClickBlock',
		'scopeObjects',
		'scopeEvents',
		'scope'
	],
	#classInstVars : [
		'aDebugger'
	],
	#category : #'Scopeo-UI-EventsPresenters'
}

{ #category : #layout }
ScpInteractionsPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		add: #roassal;
		yourself
]

{ #category : #initialization }
ScpInteractionsPresenter >> initializePresenters [

	roassal := self newRoassal
]

{ #category : #modifying }
ScpInteractionsPresenter >> objectsInteractions: aObjectsInteractions [

	roassal refresh.
	ScpInteractionsGraph new
		objectsInteractions: aObjectsInteractions;
		addInteractionMenuEntry: 'Travel back to'
		do: [ :i | self owner travelBackTo: i ];
		addInteractionMenuEntry: 'Add event in debugging scope'
		do: [ :i | self owner addInteractionToScope: i ];
		addObjectMenuEntry: 'Add object in debugging scope'
		do: [ :o | self owner addObjectToScope: o ];
		renderIn: roassal canvas
]
