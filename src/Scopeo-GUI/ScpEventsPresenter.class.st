Class {
	#name : #ScpEventsPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'table'
	],
	#category : #'Scopeo-GUI-Presenters'
}

{ #category : #layout }
ScpEventsPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		add: #table;
		yourself
]

{ #category : #initialization }
ScpEventsPresenter >> initializePresenters [

	table := self newTable.
	table
		addColumn: (SpStringTableColumn
				 title: 'Object event'
				 evaluated: [ :item | item asString ]);
		contextMenu: [
			SpMenuPresenter new
				addItem: [ :item |
					item
						name: 'Time travel to';
						action: [  ] ];
				addItem: [ :item |
					item
						name: 'Add object in the exploration scope';
						action: [  ] ];
				addItem: [ :item |
					item
						name: 'Add event in the exploration scope';
						action: [ ] ];
				yourself ];
		beResizable
]

{ #category : #modifying }
ScpEventsPresenter >> objectsEvents: aObjectsEvents [

	table items: aObjectsEvents
]
