Class {
	#name : #ScpTestImpl,
	#superclass : #MolAbstractComponentImpl,
	#traits : 'ScpTest',
	#classTraits : 'ScpTest classTrait',
	#instVars : [
		'bloc',
		'spPresenter'
	],
	#category : #Scopeo
}

{ #category : #'life cycle' }
ScpTestImpl >> componentActivate [

	spPresenter layout: (SpBoxLayout newVertical add: self getScpResultsPresenterServicesProvider spPresenter; yourself)

]

{ #category : #'life cycle' }
ScpTestImpl >> componentInitialize [

	spPresenter := SpPresenter new.

]

{ #category : #'component accessing' }
ScpTestImpl >> getScpResultsPresenterServicesProvider [
	| servicesSymbol servicesProvider itf |

	itf := ScpResultsPresenterServices.
	servicesSymbol := self servicesProviders at: itf ifAbsent: [nil].
	(servicesSymbol isNil or:[servicesSymbol isSymbol not]) ifTrue: [ ^ MolNotFoundServicesProvider new interface: itf name: nil ].

	servicesProvider := MolComponentManager default locatorServices searchServicesProviderFor: ScpResultsPresenterServices named: servicesSymbol.
	^servicesProvider
]

{ #category : #'instance creation' }
ScpTestImpl >> open [

	spPresenter open.
]
