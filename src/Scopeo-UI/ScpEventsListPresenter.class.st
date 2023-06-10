Class {
	#name : #ScpEventsListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'table',
		'parent'
	],
	#category : #'Scopeo-UI-EventsPresenters'
}

{ #category : #layout }
ScpEventsListPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		add: #table;
		yourself
]

{ #category : #initialization }
ScpEventsListPresenter >> initializePresenters [

	table := self newTable.
	table
		addColumn: (SpStringTableColumn
				 title: 'Event'
				 evaluated: [ :item | item asString ]);
		contextMenu: [
			SpMenuPresenter new
				addItem: [ :item |
					item
						name: 'Travel back to';
						action: [ parent travelBackTo: table selectedItem ] ];
				addItem: [ :item |
					item
						name: 'Add object in debugging scope';
						action: [ parent addObjectToScope: table selectedItem ] ];
				addItem: [ :item |
					item
						name: 'Add event in debugging scope';
						action: [ parent addInteractionToScope: table selectedItem  ] ];
				yourself ];
		beResizable
]

{ #category : #modifying }
ScpEventsListPresenter >> objectsEvents: aObjectsEvents [

	table items: aObjectsEvents events
]

{ #category : #accessing }
ScpEventsListPresenter >> parent: aPresenter [

	parent := aPresenter
]
