Class {
	#name : #ScopeoTrackPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'chest',
		'table',
		'remove'
	],
	#category : #'Scopeo-GUI'
}

{ #category : #layout }
ScopeoTrackPresenter class >> defaultLayout [

	^ SpBoxLayout newVertical
		add: 'Track' height: 20;
		add: (SpBoxLayout newHorizontal
			add: #remove;
			yourself) expand: false;
		add: #table expand: true;
		yourself
]

{ #category : #'event handling' }
ScopeoTrackPresenter >> chestUpdated: aEvent [

	aEvent updatedChest = chest ifFalse: [ ^ self ].
	table items: chest contents associations
]

{ #category : #initialization }
ScopeoTrackPresenter >> initialize [

	super initialize.
	chest := Chest chestDictionary 
		at: 'ScopeoTrack'
		ifAbsent: [ Chest newNamed: 'ScopeoTrack' ].
	chest initializeContents.
	Chest announcer weak 
		when: ChestUpdated
		send: #chestUpdated:
		to: self.
	chest contentsUpdated.
]

{ #category : #initialization }
ScopeoTrackPresenter >> initializePresenters [
	
	table := self newTable.
	table
		addColumn: (SpStringTableColumn 
			title: 'Name' 
			evaluated: [ :item | item chestName asString ]
		);
		addColumn: (SpStringTableColumn 
			title: 'Event' 
			evaluated: [ :item | item chestEvaluation asString ]
		);
		beMultipleSelection;
		beResizable.
	
	remove := self newButton 
		label: 'Remove';
		action: [ self removeSelected ]
		yourself
]

{ #category : #removing }
ScopeoTrackPresenter >> removeSelected [

	table selectedItems do: [ :i |
		chest removeObjectNamed: i name
	]
]
