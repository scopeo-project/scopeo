Class {
	#name : #ScopeoTraceRecorder,
	#superclass : #Object,
	#instVars : [
		'presenter',
		'recorder',
		'announcer'
	],
	#category : #'Scopeo-TraceRecorder-Source-Recorder-UI'
}

{ #category : #accessing }
ScopeoTraceRecorder >> announcer [

	 ^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #accessing }
ScopeoTraceRecorder >> initialize [

	recorder := ScpTraceRecorder new.
]

{ #category : #accessing }
ScopeoTraceRecorder >> presenter [

	^ presenter ifNil: [ presenter := ScpTraceRecorderPresenter newApplication: SpScopeoApplication new model: self  ]
]

{ #category : #accessing }
ScopeoTraceRecorder >> source [

	| sourceMenu |
	sourceMenu := ScpTraceSourceMenu new.

	sourceMenu announcer
		when: ScpTraceSourceMenuValidateEvent
		do: [ :e |
			self announcer announce: (ScpTraceRecorderSourceEvent new
					 source: e selection;
					 yourself).
			e selection ifNotNil: [ recorder source: e selection ] ].

	sourceMenu presenter open
]

{ #category : #accessing }
ScopeoTraceRecorder >> startRecording [

	recorder startRecording
]

{ #category : #accessing }
ScopeoTraceRecorder >> stopRecording [

	recorder stopRecording
]

{ #category : #accessing }
ScopeoTraceRecorder >> storage [

	recorder ifNil: [ OrderedCollection empty inspect ].

	recorder storage traces inspect
]

{ #category : #accessing }
ScopeoTraceRecorder >> switchOff [
	recorder switchOff
]

{ #category : #accessing }
ScopeoTraceRecorder >> switchOn [

	recorder switchOn
]
