Trait {
	#name : #ScpSearchPresenter,
	#traits : 'ScpComponent + ScpSpecPresenterServices',
	#classTraits : 'ScpComponent classTrait + ScpSpecPresenterServices classTrait',
	#category : #'Scopeo-Presenter-Search'
}

{ #category : #'meta-data' }
ScpSearchPresenter classSide >> dependencies [

	^ { ScpDataStorage }
]

{ #category : #'scopeo - component' }
ScpSearchPresenter classSide >> id [

	^ #ScpSearchPresenter
]
