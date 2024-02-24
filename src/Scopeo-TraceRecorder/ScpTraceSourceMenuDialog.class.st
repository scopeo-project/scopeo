Class {
	#name : #ScpTraceSourceMenuDialog,
	#superclass : #Object,
	#instVars : [
		'value',
		'announcer',
		'presenter'
	],
	#category : #'Scopeo-TraceRecorder-Source-Menu-UI'
}

{ #category : #accessing }
ScpTraceSourceMenuDialog >> announcer [

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #accessing }
ScpTraceSourceMenuDialog >> cancel [

	self announcer announce: ScpTraceSourceMenuDialogCancelEvent
]

{ #category : #accessing }
ScpTraceSourceMenuDialog >> presenter [

	^ presenter ifNil: [
		  presenter := ScpTraceSourceMenuDialogPresenter
			               newApplication: SpScopeoApplication new
			               model: self ]
]

{ #category : #accessing }
ScpTraceSourceMenuDialog >> validate [

	self announcer announce: (ScpTraceSourceMenuDialogValidateEvent new value: value; yourself)
]

{ #category : #accessing }
ScpTraceSourceMenuDialog >> value: aValue [

	value := aValue
]
