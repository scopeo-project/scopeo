Trait {
	#name : #ScpScopePresenter,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'Scopeo-Presenter-Scope'
}

{ #category : #'accessing - events' }
ScpScopePresenter classSide >> consumedComponentEvents [

	<componentContract>
	^ { ScpScopeEvents }
]

{ #category : #'accessing - services' }
ScpScopePresenter classSide >> providedComponentServices [

	<componentContract>
	^ { ScpScopePresenterServices }
]

{ #category : #'accessing - services' }
ScpScopePresenter classSide >> usedComponentServices [

	<componentContract>
	^ { ScpScopeServices }
]
