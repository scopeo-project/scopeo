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

	presenter := SpPresenter new.

	presenter layout: (SpBoxLayout newVertical
			 add: (SpBoxLayout newVertical
					  add: self getScpScopePresenterServicesProvider spPresenter;
					  add: self getScpSearchPresenterServicesProvider spPresenter;
					  yourself);
			 add: self getScpResultsPresenterServicesProvider spPresenter;
			 yourself)
]

{ #category : #accessing }
ScopeoPresenterImpl >> spPresenter [

	^ presenter
]

{ #category : #accessing }
ScopeoPresenterImpl >> title [

	^ 'Scopeo'
]
