Class {
	#name : 'ScpTracesVoidStorage',
	#superclass : 'Object',
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

{ #category : 'handlers' }
ScpTracesVoidStorage >> onCallOf: aSelector on: anObject with: aArguments [

	
]

{ #category : 'services' }
ScpTracesVoidStorage >> onMessage: aSelector to: anObject with: aArguments [
]

{ #category : 'services' }
ScpTracesVoidStorage >> onUpdateOf: aVariable of: anObject with: aValue [
]
