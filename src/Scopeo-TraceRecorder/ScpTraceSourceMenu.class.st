Class {
	#name : #ScpTraceSourceMenu,
	#superclass : #Object,
	#instVars : [
		'presenter',
		'selections',
		'selection',
		'announcer'
	],
	#category : #'Scopeo-TraceRecorder-Source-Menu-UI'
}

{ #category : #event }
ScpTraceSourceMenu >> announceUpdate [

	self announcer announce: ScpTraceSourceMenuUpdateEvent
]

{ #category : #accessing }
ScpTraceSourceMenu >> announcer [

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #accessing }
ScpTraceSourceMenu >> cancel [

	self announcer announce: ScpTraceSourceMenuCancelEvent
]

{ #category : #services }
ScpTraceSourceMenu >> create [

	| dialog |
	dialog := ScpTraceSourceMenuDialog new.
	dialog announcer
		when: ScpTraceSourceMenuDialogValidateEvent
		do: [ :e | self createSource: e value ].
	dialog presenter open
]

{ #category : #private }
ScpTraceSourceMenu >> createSource: aName [

	| browser |
	browser := ScpTraceSourceBrowser new.

	browser announcer
		when: ScpTraceSourceBrowserValidateEvent
		do: [ :e | selections at: aName put: e selection ].

	browser presenter open
]

{ #category : #'submorphs - add/remove' }
ScpTraceSourceMenu >> delete [

	selections remove: selection
]

{ #category : #services }
ScpTraceSourceMenu >> edit [

	| browser source |
	browser := ScpTraceSourceBrowser new.
	source := selections at: selection.

	browser announcer
		when: ScpTraceSourceBrowserValidateEvent
		do: [ :e |
			source packages: e selection packages.
			source classes: e selection classes.
			source methods: e selection methods ].
	
	browser traceSourceSelection: source.
		
	browser presenter open
]

{ #category : #initialization }
ScpTraceSourceMenu >> initialize [

	selections := ScpTraceSourceSelectionRegistry instance.
	selections announcer
		when: ScpTraceSourceSelectionRegistryEvent
		send: #announceUpdate
		to: self
]

{ #category : #accessing }
ScpTraceSourceMenu >> presenter [

	^ presenter ifNil: [ presenter := ScpTraceSourceMenuPresenter newApplication: SpScopeoApplication new model: self ]
]

{ #category : #accessing }
ScpTraceSourceMenu >> selection: aSelection [

	selection := aSelection
]

{ #category : #services }
ScpTraceSourceMenu >> selections [

	^ selections selections keys
]

{ #category : #accessing }
ScpTraceSourceMenu >> validate [

	self announcer announce: (ScpTraceSourceMenuValidateEvent new selection: (selections at: selection); yourself)
]
