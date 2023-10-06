Trait {
	#name : #ScpScopePresenter,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'Scopeo-Scope'
}

{ #category : #'accessing - events' }
ScpScopePresenter classSide >> consumedComponentEvents [

	<componentContract>
	^ { ScpScopeEvents }
]

{ #category : #'accessing - services' }
ScpScopePresenter classSide >> usedComponentServices [

	<componentContract>
	^ { ScpScopeServices }
]
