Class {
	#name : #ScpTraceSourceBrowser,
	#superclass : #Object,
	#instVars : [
		'items',
		'filter',
		'selection',
		'announcer',
		'presenter'
	],
	#category : #'Scopeo-TraceRecorder-Source-Browser-UI'
}

{ #category : #event }
ScpTraceSourceBrowser >> announceUpdate [

	self announcer announce: (ScpTraceSourceBrowserItemsUpdateEvent new items: items ; yourself)
]

{ #category : #accessing }
ScpTraceSourceBrowser >> announcer [

	^ announcer ifNil: [ announcer := Announcer new ]

]

{ #category : #accessing }
ScpTraceSourceBrowser >> cancel [

	self announcer announce: ScpTraceSourceBrowserCancelEvent
]

{ #category : #event }
ScpTraceSourceBrowser >> filter [

	^ filter
]

{ #category : #initialization }
ScpTraceSourceBrowser >> initialize [

	filter := ScpTraceSourceBrowserFilter new
		          model: self;
		          yourself.

	selection := ScpTraceSourceBrowserSelection new
		             model: self;
		             yourself.

	items := ScpTraceSourceBrowserItems new
		         filter: filter;
		         selection: selection;
		         yourself
]

{ #category : #accessing }
ScpTraceSourceBrowser >> items [

	^ items
]

{ #category : #accessing }
ScpTraceSourceBrowser >> presenter [

	^ presenter ifNil: [ presenter := ScpTraceSourceBrowserPresenter newApplication: SpScopeoApplication new 
	model: self ]
]

{ #category : #event }
ScpTraceSourceBrowser >> selection [

	^ selection
]

{ #category : #'instance creation' }
ScpTraceSourceBrowser >> traceSourceSelection: aScpTraceSourceSelection [




	selection packages: aScpTraceSourceSelection packages copy.
	selection classes: aScpTraceSourceSelection classes copy.
	selection methods: aScpTraceSourceSelection methods copy.

	self announceUpdate
]

{ #category : #accessing }
ScpTraceSourceBrowser >> validate [

	self announcer announce: (ScpTraceSourceBrowserValidateEvent new
			 selection: self selection buildTraceSourceSelection;
			 yourself)
]
