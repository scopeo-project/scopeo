Class {
	#name : #ScpScopePresenterImpl,
	#superclass : #MolAbstractComponentImpl,
	#traits : 'ScpScopePresenter + ScpScopeEvents + ScpScopePresenterServices',
	#classTraits : 'ScpScopePresenter classTrait + ScpScopeEvents classTrait + ScpScopePresenterServices classTrait',
	#instVars : [
		'pane',
		'objectKeys',
		'objectValues',
		'objectEventsKeys',
		'objectEventsValues',
		'keysPane',
		'valuesPane'
	],
	#category : #'Scopeo-Scope-Presenter'
}

{ #category : #'component events' }
ScpScopePresenterImpl >> addedObjectEvents: anObjectEventsCollection to: anAssociation [

	self loadObjectEventsKeys
]

{ #category : #'component events' }
ScpScopePresenterImpl >> addedObjects: anObjectCollection to: anAssociation [

	self loadObjectsKeys
]

{ #category : #accessing }
ScpScopePresenterImpl >> blPresenter [

	^ pane
]

{ #category : #'life cycle' }
ScpScopePresenterImpl >> componentActivate [

	self getScpScopeEventsSubscriber subscribe: self
]

{ #category : #'life cycle' }
ScpScopePresenterImpl >> componentPassivate [

	self getScpScopeEventsSubscriber unsubscribe: self
]

{ #category : #'component accessing' }
ScpScopePresenterImpl >> getScpScopeEventsSubscriber [
	| eventsSymbol eventsSubscriber itf |
	itf := ScpScopeEvents.
	eventsSymbol := self eventsSubscribers at: itf ifAbsent: [^MolNotFoundEventsSubscriber new interface: itf name: nil].
	eventsSymbol isCollection
	 	ifTrue: 
			[eventsSubscriber := MolComponentManager default locatorServices 
						searchEventsSubscriberFor: ScpScopeEvents named: eventsSymbol ]. 
	^eventsSubscriber
]

{ #category : #'component accessing' }
ScpScopePresenterImpl >> getScpScopeServicesProvider [
	| servicesSymbol servicesProvider itf |

	itf := ScpScopeServices.
	servicesSymbol := self servicesProviders at: itf ifAbsent: [nil].
	(servicesSymbol isNil or:[servicesSymbol isSymbol not]) ifTrue: [ ^ MolNotFoundServicesProvider new interface: itf name: nil ].

	servicesProvider := MolComponentManager default locatorServices searchServicesProviderFor: ScpScopeServices named: servicesSymbol.
	^servicesProvider
]

{ #category : #initialization }
ScpScopePresenterImpl >> initialize [

	pane := ToPane new.

	self initializeKeysPane.
	self initializeValuesPane.

	self initializeLayout.
	
self loadObjectsKeys.
self loadObjectEventsKeys
]

{ #category : #initialization }
ScpScopePresenterImpl >> initializeKeysPane [

	keysPane := ToPane new
		            id: #keys;
		            yourself.

	self initializeObjectKeysList.
	self initializeObjectEventsKeysList.
	self initializeKeysPaneLayout.
]

{ #category : #initialization }
ScpScopePresenterImpl >> initializeKeysPaneLayout [

	keysPane beVertical.
	keysPane vMatchParent.
	keysPane hExact: 100.

	keysPane addChild: objectKeys.
	keysPane addChild: objectEventsKeys
]

{ #category : #initialization }
ScpScopePresenterImpl >> initializeLayout [

	pane beHorizontal.
	pane matchParent.

	pane addChild: keysPane.
	pane addChild: valuesPane.
	pane addDividers
]

{ #category : #initialization }
ScpScopePresenterImpl >> initializeObjectEventsKeysList [

	objectEventsKeys := ToListElement new
		                    id: #objectEventsKeys;
		                    nodeFactory: [ :keys |
			                    ToLabeledNode new
				                    labelText: keys;
				                    hMatchParent;
				                    yourself ].

	objectEventsKeys margin: (BlInsets all: 2).

	objectEventsKeys infinite
		when: ToInfiniteNodeSelectedEvent
		do: [ :event |
			self objectEventsKeysNewSelection: event index ]
]

{ #category : #initialization }
ScpScopePresenterImpl >> initializeObjectEventsValuesList [

	objectEventsValues := ToListElement new
		                id: #objectEventsValues;
		                nodeFactory: [ :keys |
			                ToLabeledNode new
				                labelText: keys;
				                hMatchParent;
				                yourself ].

	objectEventsValues margin: (BlInsets all: 2)
]

{ #category : #initialization }
ScpScopePresenterImpl >> initializeObjectKeysList [

	objectKeys := ToListElement new
		              id: #objectKeys;
		              nodeFactory: [ :keys |
			              ToLabeledNode new
				              labelText: keys;
				              hMatchParent;
				              yourself ].

	objectKeys margin: (BlInsets all: 2).

	objectKeys infinite
		when: ToInfiniteNodeSelectedEvent
		do: [ :event |
		self objectKeysNewSelection: event index ]
]

{ #category : #initialization }
ScpScopePresenterImpl >> initializeObjectValuesList [

	objectValues := ToListElement new
		                id: #objectValues;
		                nodeFactory: [ :keys |
			                ToLabeledNode new
				                labelText: keys;
				                hMatchParent;
				                yourself ].
			
	objectValues margin: (BlInsets all: 2)
]

{ #category : #initialization }
ScpScopePresenterImpl >> initializeValuesPane [

	valuesPane := ToPane new
		              id: #values;
		              yourself.
		
	self initializeObjectValuesList.
	self initializeObjectEventsValuesList.
	self initializeValuesPaneLayout.
]

{ #category : #initialization }
ScpScopePresenterImpl >> initializeValuesPaneLayout [

	valuesPane beVertical.
	valuesPane matchParent.

	valuesPane addChild: objectValues.
	valuesPane addChild: objectEventsValues
]

{ #category : #data }
ScpScopePresenterImpl >> loadObjectEventsKeys [

	| sp |
	sp := self getScpScopeServicesProvider.
	
	objectEventsKeys data removeAll.
	
	sp isNotFoundServices ifTrue: [ ^ self ].
	objectEventsKeys data addAll: sp getObjectEventsKeys
]

{ #category : #data }
ScpScopePresenterImpl >> loadObjectsKeys [

	| sp |
	sp := self getScpScopeServicesProvider.
	
	objectKeys  data removeAll.
	
	sp isNotFoundServices ifTrue: [ ^ self ].
	objectKeys data addAll: sp getObjectsKeys
]

{ #category : #'gui events' }
ScpScopePresenterImpl >> objectEventsKeysNewSelection: anIndex [

	| sp key |
	sp := self getScpScopeServicesProvider.

	objectEventsValues data removeAll.

	sp isNotFoundServices ifTrue: [ ^ self ].

	key := sp getObjectEventsKeys at: anIndex.
	objectEventsValues data addAll: (sp getObjectEventAt: key)
]

{ #category : #'gui events' }
ScpScopePresenterImpl >> objectKeysNewSelection: anIndex [

	| sp key |
	sp := self getScpScopeServicesProvider.

	objectValues data removeAll.

	sp isNotFoundServices ifTrue: [ ^ self ].

	key := sp getObjectsKeys at: anIndex.
	objectValues data addAll: (sp getObjectsAt: key)
]

{ #category : #accessing }
ScpScopePresenterImpl >> title [

	^ 'Scopeo - Scope'
]
