Class {
	#name : #ScopeoEventsScopePresenter,
	#superclass : #ScopeoScopePresenter,
	#category : #'Scopeo-UI-ScopePresenters'
}

{ #category : #removing }
ScopeoEventsScopePresenter >> removeSelected [

	table selectedItems do: [ :i |
		scope removeEvent: i key
	]
]

{ #category : #accessing }
ScopeoEventsScopePresenter >> scope: aScope [

	super scope: aScope.
	aScope announcer when: EventsScopeUpdated send: #scopeUpdated: to: self
]

{ #category : #accessing }
ScopeoEventsScopePresenter >> title [

	^ 'Debugging scope - events'
]
