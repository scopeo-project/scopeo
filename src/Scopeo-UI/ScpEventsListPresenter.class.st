Class {
	#name : #ScpEventsListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'table'
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
						action: [ self owner travelBackTo: item  ] ];
				addItem: [ :item |
					item
						name: 'Add object in debugging scope';
						action: [ self owner addObjectToScope: item ] ];

addItem: [ :item |
					item
						name: 'Add event in debugging scope';
						action: [ self owner addInteractionToScope: item ] ];				yourself ];
		beResizable
]

{ #category : #modifying }
ScpEventsListPresenter >> objectsEvents: aObjectsEvents [

	table items: aObjectsEvents events
]
