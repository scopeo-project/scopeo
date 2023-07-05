Class {
	#name : #ScpScopePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'table',
		'remove',
		'scope'
	],
	#category : #'Scopeo-UI-Presenters'
}

{ #category : #layout }
ScpScopePresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  add: 'Exploration scope' expand: false;
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
				 title: 'Label'
				 evaluated: [ :item | item key asString ]);
		addColumn: (SpStringTableColumn title: 'Type' evaluated: [ :item |
					 (item value class isInClassHierarchyOf: ScpObjectEvent)
						 ifTrue: [ ^ 'Object event' ]
						 ifFalse: [ ^ 'Object' ] ]);
		addColumn: (SpStringTableColumn
				 title: 'Short description'
				 evaluated: [ :item | item value asString ]);
		beMultipleSelection;
		beResizable.
	remove := self newButton
		          icon: (self iconNamed: #remove);
		          action: [ self removeSelected ];
		          yourself
]

{ #category : #removing }
ScpScopePresenter >> removeSelected [

	table selectedItems do: [ :i | scope remove: i key ]
]
