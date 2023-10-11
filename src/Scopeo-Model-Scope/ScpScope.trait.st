Trait {
	#name : #ScpScope,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'Scopeo-Model-Scope'
}

{ #category : #'accessing - events' }
ScpScope classSide >> producedComponentEvents [
	<componentContract>
	^ {ScpScopeEvents} 
]

{ #category : #'accessing - services' }
ScpScope classSide >> providedComponentServices [

	<componentContract>
	^ { ScpScopeServices }
]
