Class {
	#name : #ScpScopePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'chest',
		'table',
		'remove',
		'title',
		'scopeName',
		'scope'
	],
	#category : #'Scopeo-UI-ScopePresenters'
}

{ #category : #layout }
ScpScopePresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		add: self title expand: false;
		add: (SpBoxLayout newHorizontal
			add: table;
			add: remove width: 40;
			yourself);
		yourself
]

{ #category : #initialization }
ScpScopePresenter >> initializePresenters [
	
	table := self newTable.
	table
		addColumn: (SpStringTableColumn 
			title: 'Name' 
			evaluated: [ :item | item key asString ]
		);
		addColumn: (SpStringTableColumn 
			title: 'Element' 
			evaluated: [ :item | item value asString ]
		);
		beMultipleSelection;
		beResizable.
	
	remove := self newButton 
		icon: (self iconNamed: #remove);
		action: [ self removeSelected ]
		yourself
]

{ #category : #removing }
ScpScopePresenter >> removeSelected [

	self subclassResponsibility
]

{ #category : #accessing }
ScpScopePresenter >> scope: aScope [

	scope := aScope
]

{ #category : #'event handling' }
ScpScopePresenter >> scopeUpdated: aAnnouncement [

	table items: aAnnouncement items
]

{ #category : #accessing }
ScpScopePresenter >> title [

	self subclassResponsibility
]

{ #category : #accessing }
ScpScopePresenter >> title: aTitle [

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
