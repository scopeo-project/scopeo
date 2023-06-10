Class {
	#name : #ScpInteractionsPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'roassal',
		'parent'
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
		do: [ :i | parent travelBackTo: i ];
		addInteractionMenuEntry: 'Add event in debugging scope'
		do: [ :i | parent addInteractionToScope: i ];
		addObjectMenuEntry: 'Add object in debugging scope'
		do: [ :o | parent addObjectToScope: o ];
		renderIn: roassal canvas
]

{ #category : #accessing }
ScpInteractionsPresenter >> parent: aPresenter [

	parent := aPresenter
]
