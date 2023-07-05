Class {
	#name : #ScpEventsScopePresenter,
	#superclass : #SpPresenter,
	#category : #'Scopeo-GUI-Scope'
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
