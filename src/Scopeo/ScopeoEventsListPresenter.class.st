Class {
	#name : #ScopeoEventsListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'table'
	],
	#category : #'Scopeo-GUI'
}

{ #category : #layout }
ScopeoEventsListPresenter class >> defaultLayout [

	^ SpBoxLayout newVertical
		add: #table;
		yourself
]

{ #category : #initialization }
ScopeoEventsListPresenter >> initializePresenters [

	table := self newTable.
	table
		addColumn: (SpStringTableColumn 
			title: 'Event' 
			evaluated: [ :item | item asString ]
		);
		beResizable.
]

{ #category : #modifying }
ScopeoEventsListPresenter >> objectsEvents: aObjectsEvents [

	table items: aObjectsEvents events
]