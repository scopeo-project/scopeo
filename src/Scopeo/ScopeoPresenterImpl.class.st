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
ScopeoPresenterImpl >> componentInitialize [

	self getScpScopePresenterServicesProvider spPresenter inspect.

	spPresenter layout: (SpBoxLayout newVertical
			 add: (SpBoxLayout newHorizontal
					  add: self getScpScopePresenterServicesProvider spPresenter height: 50;
					  add: self getScpSearchPresenterServicesProvider spPresenter;
					  yourself);
			add: self getScpResultsPresenterServicesProvider spPresenter expand:true;
			add: SpBlSpaceInMorphPresenter new;
			 yourself)
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

{ #category : #initialization }
ScopeoPresenterImpl >> initialize [

	spPresenter := SpPresenter new.
	spPresenter layout: (SpBoxLayout newVertical)
]

{ #category : #accessing }
ScopeoPresenterImpl >> title [

	^ 'Scopeo'
]
