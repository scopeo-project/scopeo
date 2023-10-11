Trait {
	#name : #ScopeoPresenter,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #Scopeo
}

{ #category : #'accessing - services' }
ScopeoPresenter classSide >> providedComponentServices [

	<componentContract>
	^ { ScopeoPresenterServices }
]

{ #category : #'accessing - services' }
ScopeoPresenter classSide >> usedComponentServices [

	<componentContract>
	^ { ScpScopePresenterServices . ScpSearchPresenterServices
	   . ScpResultsPresenterServices  }
]
