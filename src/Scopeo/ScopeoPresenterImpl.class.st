Class {
	#name : #ScopeoPresenterImpl,
	#superclass : #MolAbstractComponentImpl,
	#traits : 'ScopeoPresenter + ScopeoPresenterServices',
	#classTraits : 'ScopeoPresenter classTrait + ScopeoPresenterServices classTrait',
	#instVars : [
		'presenter'
	],
	#category : #Scopeo
}

{ #category : #'life cycle' }
ScopeoPresenterImpl >> componentActivate [

	spPresenter layout: (SpBoxLayout newVertical
			 add: (SpBoxLayout newHorizontal
					  add: ScpScopePresenterImpl start spPresenter;
					  add: ScpSearchPresenterImpl start spPresenter;
					  yourself);
			 add: ScpResultsPresenterImpl start spPresenter;
			 yourself)
]

{ #category : #'life cycle' }
ScopeoPresenterImpl >> componentInitialize [

	spPresenter := SpPresenter new.
]

{ #category : #'life cycle' }
ScopeoPresenterImpl >> componentPassivate [

	ScpScopePresenterImpl stop.
	ScpSearchPresenterImpl stop.
	ScpResultsPresenterImpl stop.
]

{ #category : #'component accessing' }
ScopeoPresenterImpl >> getScpResultsPresenterServicesProvider [
	| servicesSymbol servicesProvider itf |

	itf := ScpResultsPresenterServices.
	servicesSymbol := self servicesProviders at: itf ifAbsent: [nil].
	(servicesSymbol isNil or:[servicesSymbol isSymbol not]) ifTrue: [ ^ MolNotFoundServicesProvider new interface: itf name: nil ].

	servicesProvider := MolComponentManager default locatorServices searchServicesProviderFor: ScpResultsPresenterServices named: servicesSymbol.
	^servicesProvider
]

{ #category : #'component accessing' }
ScopeoPresenterImpl >> getScpScopePresenterServicesProvider [
	| servicesSymbol servicesProvider itf |

	itf := ScpScopePresenterServices.
	servicesSymbol := self servicesProviders at: itf ifAbsent: [nil].
	(servicesSymbol isNil or:[servicesSymbol isSymbol not]) ifTrue: [ ^ MolNotFoundServicesProvider new interface: itf name: nil ].

	servicesProvider := MolComponentManager default locatorServices searchServicesProviderFor: ScpScopePresenterServices named: servicesSymbol.
	^servicesProvider
]

{ #category : #'component accessing' }
ScopeoPresenterImpl >> getScpSearchPresenterServicesProvider [
	| servicesSymbol servicesProvider itf |

	itf := ScpSearchPresenterServices.
	servicesSymbol := self servicesProviders at: itf ifAbsent: [nil].
	(servicesSymbol isNil or:[servicesSymbol isSymbol not]) ifTrue: [ ^ MolNotFoundServicesProvider new interface: itf name: nil ].

	servicesProvider := MolComponentManager default locatorServices searchServicesProviderFor: ScpSearchPresenterServices named: servicesSymbol.
	^servicesProvider
]

{ #category : #services }
ScopeoPresenterImpl >> title [

	^ 'Scopeo'
]
