Class {
	#name : #ScpSearchImpl,
	#superclass : #MolAbstractComponentImpl,
	#traits : 'ScpSearch + ScpSearchServices',
	#classTraits : 'ScpSearch classTrait + ScpSearchServices classTrait',
	#category : #'Scopeo-Model-Search'
}

{ #category : #'component accessing' }
ScpSearchImpl >> getScpDataStorageServicesProvider [
	| servicesSymbol servicesProvider itf |

	itf := ScpDataStorageServices.
	servicesSymbol := self servicesProviders at: itf ifAbsent: [nil].
	(servicesSymbol isNil or:[servicesSymbol isSymbol not]) ifTrue: [ ^ MolNotFoundServicesProvider new interface: itf name: nil ].

	servicesProvider := MolComponentManager default locatorServices searchServicesProviderFor: ScpDataStorageServices named: servicesSymbol.
	^servicesProvider
]

{ #category : #'component accessing' }
ScpSearchImpl >> getScpSearchEventsNotifier [
	^self eventsNotifiers at: ScpSearchEvents ifAbsent: [^MolNotFoundEventsNotifier new interface: ScpSearchEvents name: nil].
]

{ #category : #'typing/selecting keys' }
ScpSearchImpl >> search: aPredicate [

	| sp events |
	events := OrderedCollection empty.

	sp := self getScpDataStorageServicesProvider.
	sp isNotFoundServices ifFalse: [
		events := sp events select: [ :e | aPredicate verify: e ]. ].

	self getScpSearchEventsNotifier
		searchedEvents: events
]
