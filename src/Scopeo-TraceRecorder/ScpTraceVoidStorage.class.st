Class {
	#name : #ScpTraceVoidStorage,
	#superclass : #ScpInstrumentationHandler,
	#category : #'Scopeo-TraceRecorder-Model'
}

{ #category : #accessing }
ScpTraceVoidStorage >> traces [

	^ OrderedCollection empty
]
