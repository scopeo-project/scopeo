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

	ScpEventsGraph new
		events: aObjectsInteractions;
		renderIn: roassal canvas.
"
	ScpInteractionsGraph new
		objectsInteractions: aObjectsInteractions;
		addInteractionMenuEntry: 'Time travel to'
		do: [ :i | parent travelBackTo: i ];
		addInteractionMenuEntry: 'Add event in the exploration scope'
		do: [ :i | parent addInteractionToScope: i ];
		addObjectMenuEntry: 'Add object in the exploration scope'
		do: [ :o | parent addObjectToScope: o ];
		renderIn: roassal canvas"
]

{ #category : #accessing }
ScpInteractionsPresenter >> parent: aPresenter [

	parent := aPresenter
]
