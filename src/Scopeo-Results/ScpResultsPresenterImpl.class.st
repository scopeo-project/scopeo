Class {
	#name : #ScpResultsPresenterImpl,
	#superclass : #MolAbstractComponentImpl,
	#traits : 'ScpResultsPresenter + ScpSearchEvents',
	#classTraits : 'ScpResultsPresenter classTrait + ScpSearchEvents classTrait',
	#instVars : [
		'pane',
		'objectEvents',
		'codePane'
	],
	#category : #'Scopeo-Results'
}

{ #category : #accessing }
ScpResultsPresenterImpl >> blPresenter [

	^ pane
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

{ #category : #initialization }
ScpResultsPresenterImpl >> initialize [

	pane := ToPane new.
	pane matchParent.

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

	pane addChild: objectEvents.
	pane addChild: codePane.
	pane addDividers
]

{ #category : #event }
ScpResultsPresenterImpl >> searchedEvents: anObjectEvents [

	objectEvents data removeAll.
	objectEvents data addAll: anObjectEvents.
]

{ #category : #accessing }
ScpResultsPresenterImpl >> title [

	^ 'Scopeo - Results'
]
