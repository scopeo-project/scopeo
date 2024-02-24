Class {
	#name : #ScpTraceRecorderSourceEvent,
	#superclass : #Announcement,
	#instVars : [
		'source'
	],
	#category : #'Scopeo-TraceRecorder-Source-Recorder-UI'
}

{ #category : #accessing }
ScpTraceRecorderSourceEvent >> source [

	^ source
]

{ #category : #accessing }
ScpTraceRecorderSourceEvent >> source: anObject [

	source := anObject
]
