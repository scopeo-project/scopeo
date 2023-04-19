Class {
	#name : #ScopeoScopePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'chest',
		'table',
		'remove'
	],
	#category : #'Scopeo-GUI'
}

{ #category : #layout }
ScopeoScopePresenter class >> defaultLayout [

	^ SpBoxLayout newVertical
		add: 'Scope' height: 20;
		add: (SpBoxLayout newHorizontal
			add: #remove;
			yourself) expand: false;
		add: #table expand: true;
		yourself
]

{ #category : #'event handling' }
ScopeoScopePresenter >> chestUpdated: aEvent [

	aEvent updatedChest = chest ifFalse: [ ^ self ].
	table items: chest contents associations
]

{ #category : #initialization }
ScopeoScopePresenter >> initialize [

	super initialize.
	chest := Chest chestDictionary 
		at: 'Scopeo'
		ifAbsent: [ Chest newNamed: 'Scopeo' ].
	Chest announcer weak 
		when: ChestUpdated
		send: #chestUpdated:
		to: self.
	chest contentsUpdated.
]

{ #category : #initialization }
ScopeoScopePresenter >> initializePresenters [
	
	table := self newTable.
	table
		addColumn: (SpStringTableColumn 
			title: 'Name' 
			evaluated: [ :item | item chestName asString ]
		);
		addColumn: (SpStringTableColumn 
			title: 'Object' 
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
ScopeoScopePresenter >> removeSelected [

	table selectedItems do: [ :i |
		chest removeObjectNamed: i name
	]
]
