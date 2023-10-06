Trait {
	#name : #ScpScope,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'Scopeo-Scope'
}

{ #category : #'accessing - services' }
ScpScope classSide >> providedComponentServices [

	<componentContract>
	^ { ScpScopeServices }
]

{ #category : #'accessing - parameters' }
ScpScope classSide >> usedComponentParameters [

	<componentContract>
	^ { ScpScopeEvents }
]
