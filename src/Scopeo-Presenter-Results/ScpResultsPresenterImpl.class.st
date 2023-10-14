Class {
	#name : #ScpResultsPresenterImpl,
	#superclass : #MolAbstractComponentImpl,
	#traits : 'ScpResultsPresenter + ScpSearchEvents + ScpResultsPresenterServices',
	#classTraits : 'ScpResultsPresenter classTrait + ScpSearchEvents classTrait + ScpResultsPresenterServices classTrait',
	#instVars : [
		'objectEvents',
		'codePane'
	],
	#category : #'Scopeo-Presenter-Results'
}

{ #category : #'life cycle' }
ScpResultsPresenterImpl >> componentActivate [

	self getScpSearchEventsSubscriber subscribe: self
]

{ #category : #'life cycle' }
ScpResultsPresenterImpl >> componentInitialize [

	blPresenter := ToPane new.
	blPresenter matchParent.

	objectEvents := ToListElement new
		                id: #objectEvents;
		                nodeFactory: [ :event |
			                ToLabeledNode new
				                labelText: event printString;
				                hMatchParent;
				                yourself ].
	objectEvents margin: (BlInsets all: 2).
	objectEvents matchParent.
	
	codePane := ToAlbumModel new withRowNumbers onWidget.
	codePane withSoftLine.

	blPresenter addChild: objectEvents.
	blPresenter addChild: codePane.
	blPresenter addDividers
]

{ #category : #'life cycle' }
ScpResultsPresenterImpl >> componentPassivate [

	self getScpSearchEventsSubscriber unsubscribe: self
]

{ #category : #'component accessing' }
ScpResultsPresenterImpl >> getScpScopeServicesProvider [
	| servicesSymbol servicesProvider itf |

	itf := ScpScopeServices.
	servicesSymbol := self servicesProviders at: itf ifAbsent: [nil].
	(servicesSymbol isNil or:[servicesSymbol isSymbol not]) ifTrue: [ ^ MolNotFoundServicesProvider new interface: itf name: nil ].

	servicesProvider := MolComponentManager default locatorServices searchServicesProviderFor: ScpScopeServices named: servicesSymbol.
	^servicesProvider
]

{ #category : #'component accessing' }
ScpResultsPresenterImpl >> getScpSearchEventsSubscriber [
	| eventsSymbol eventsSubscriber itf |
	itf := ScpSearchEvents.
	eventsSymbol := self eventsSubscribers at: itf ifAbsent: [^MolNotFoundEventsSubscriber new interface: itf name: nil].
	eventsSymbol isCollection
	 	ifTrue: 
			[eventsSubscriber := MolComponentManager default locatorServices 
						searchEventsSubscriberFor: ScpSearchEvents named: eventsSymbol ]. 
	^eventsSubscriber
]

{ #category : #event }
ScpResultsPresenterImpl >> searchedEvents: anObjectEvents [

	objectEvents data removeAll.
	objectEvents data addAll: anObjectEvents.
]

{ #category : #services }
ScpResultsPresenterImpl >> title [

	^ 'Scopeo - Results'
]
