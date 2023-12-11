Class {
	#name : 'ScpTracesVoidStorage',
	#superclass : 'ScpInstrumentationHandler',
	#category : 'Scopeo-Traces',
	#package : 'Scopeo-Traces'
}

{ #category : 'accessing' }
ScpTracesVoidStorage >> clear [

	"Do nothing"
]

{ #category : 'actions api' }
ScpTracesVoidStorage >> fetch: aScpPredicate [

	^ []
]
