Class {
	#name : #ScpEventsScopePresenter,
	#superclass : #ScpScopePresenter,
	#category : #'Scopeo-UI-ScopePresenters'
}

{ #category : #removing }
ScpEventsScopePresenter >> removeSelected [

	table selectedItems do: [ :i |
		scope removeEvent: i key
	]
]

{ #category : #accessing }
ScpEventsScopePresenter >> scope: aScope [

	super scope: aScope.
	aScope announcer when: ScpEventsScopeUpdated send: #scopeUpdated: to: self
]

{ #category : #accessing }
ScpEventsScopePresenter >> title [

	^ 'Exploration scope - events'
]
