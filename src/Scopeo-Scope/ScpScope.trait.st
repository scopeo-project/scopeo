Trait {
	#name : #ScpScope,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'Scopeo-Scope-Model'
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
