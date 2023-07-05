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

	| items |
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
						action: [ parent travelBackTo: table selectedItem ] ];
				addItem: [ :item |
					item
						name: 'Add object in the exploration scope';
						action: [ parent addObjectToScope: table selectedItem ] ];
				addItem: [ :item |
					item
						name: 'Add event in the exploration scope';
						action: [ parent addInteractionToScope: table selectedItem ] ];
				yourself ];
		beResizable.
	items := OrderedCollection new.

	items add: (ScpInteraction new
			 origin: (ScpObjectWrapper new
					  object: Grapevine new;
					  id: 17732;
					  yourself);
			 destination: (ScpObjectWrapper new
					  object: Player new;
					  id: 230;
					  yourself);
			 selector: #secret;
			 yourself).
	items add: (ScpInteraction new
			 origin: (ScpObjectWrapper new
					  object: Grapevine new;
					  id: 17732;
					  yourself);
			 destination: (ScpObjectWrapper new
					  object: Player new;
					  id: 17745;
					  yourself);
			 selector: #secret;
			 yourself).

	table items: items
]

{ #category : #modifying }
ScpEventsListPresenter >> objectsEvents: aObjectsEvents [

	table items: aObjectsEvents events
]

{ #category : #accessing }
ScpEventsListPresenter >> parent: aPresenter [

	parent := aPresenter
]
