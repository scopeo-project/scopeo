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
			evaluated: [ :item | item asString ]
		);
		beResizable.
]

{ #category : #modifying }
ScpEventsListPresenter >> objectsEvents: aObjectsEvents [

	table items: aObjectsEvents events
]
