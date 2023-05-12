Class {
	#name : #ScopeoObjectsScopePresenter,
	#superclass : #ScopeoScopePresenter,
	#category : #'Scopeo-UI-ScopePresenters'
}

{ #category : #removing }
ScopeoObjectsScopePresenter >> removeSelected [

	table selectedItems do: [ :i | 
		scope removeObject: i key
	]
]

{ #category : #accessing }
ScopeoObjectsScopePresenter >> scope: aScope [

	super scope: aScope.
	aScope announcer when: ObjectsScopeUpdated send: #scopeUpdated: to: self
]

{ #category : #accessing }
ScopeoObjectsScopePresenter >> title [

	^ 'Debugging scope - objects'
]
