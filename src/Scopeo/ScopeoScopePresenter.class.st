Class {
	#name : #ScopeoScopePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'chest',
		'table',
		'remove',
		'title',
		'scopeName'
	],
	#category : #'Scopeo-GUI'
}

{ #category : #'event handling' }
ScopeoScopePresenter >> chestUpdated: aEvent [

	
]

{ #category : #layout }
ScopeoScopePresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		add: title height: 20;
		add: (SpBoxLayout newHorizontal
			add: table;
			add: remove expand: false;
			yourself);
		yourself
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
			title: 'Element' 
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

{ #category : #accessing }
ScopeoScopePresenter >> title: aTitle [

	"chest := Chest chestDictionary 
		at: aTitle
		ifAbsent: [ Chest newNamed: aTitle ]."
	"chest initializeContents. 
	Chest announcer weak 
		when: ChestUpdated
		send: #chestUpdated:
		to: self.
	chest contentsUpdated."
]
