Trait {
	#name : #ScpSearch,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'Scopeo-Search-Model'
}

{ #category : #'accessing - events' }
ScpSearch classSide >> producedComponentEvents [

	<componentContract>
	^ { ScpSearchEvents }
]

{ #category : #'accessing - services' }
ScpSearch classSide >> providedComponentServices [

	<componentContract>
	^ { ScpSearchServices }
]

{ #category : #'accessing - services' }
ScpSearch classSide >> usedComponentServices [

	<componentContract>
	^ { ScpDataStorageServices }
]
