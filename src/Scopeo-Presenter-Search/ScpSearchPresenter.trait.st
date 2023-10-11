Trait {
	#name : #ScpSearchPresenter,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'Scopeo-Presenter-Search'
}

{ #category : #'accessing - services' }
ScpSearchPresenter classSide >> providedComponentServices [

	<componentContract>
	^ { ScpSearchPresenterServices }
]

{ #category : #'accessing - services' }
ScpSearchPresenter classSide >> usedComponentServices [

	<componentContract>
	^ { ScpSearchServices }
]
