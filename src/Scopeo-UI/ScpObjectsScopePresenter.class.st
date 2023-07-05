Class {
	#name : #ScpObjectsScopePresenter,
	#superclass : #ScpScopePresenter,
	#category : #'Scopeo-UI-ScopePresenters'
}

{ #category : #removing }
ScpObjectsScopePresenter >> removeSelected [

	table selectedItems do: [ :i | 
		scope removeObject: i key
	]
]

{ #category : #accessing }
ScpObjectsScopePresenter >> scope: aScope [

	super scope: aScope.
	aScope announcer when: ScpObjectsScopeUpdated send: #scopeUpdated: to: self
]

{ #category : #accessing }
ScpObjectsScopePresenter >> title [

	^ 'Exploration scope - objects'
]
