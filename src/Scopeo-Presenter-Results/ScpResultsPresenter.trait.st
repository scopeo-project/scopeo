Trait {
	#name : #ScpResultsPresenter,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'Scopeo-Presenter-Results'
}

{ #category : #'accessing - events' }
ScpResultsPresenter classSide >> consumedComponentEvents [

	<componentContract>
	^ { ScpSearchEvents }
]

{ #category : #'accessing - services' }
ScpResultsPresenter classSide >> providedComponentServices [

	<componentContract>
	^ { ScpResultsPresenterServices }
]

{ #category : #'accessing - services' }
ScpResultsPresenter classSide >> usedComponentServices [

	<componentContract>
	^ { ScpScopeServices}
]
