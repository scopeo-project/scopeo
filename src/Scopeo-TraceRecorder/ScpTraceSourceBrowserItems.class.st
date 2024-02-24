Class {
	#name : #ScpTraceSourceBrowserItems,
	#superclass : #Object,
	#instVars : [
		'filter',
		'selection'
	],
	#category : #'Scopeo-TraceRecorder-Source-Browser-UI'
}

{ #category : #accessing }
ScpTraceSourceBrowserItems >> classes [

	^ self filter: (selection packages flatCollect: [ :p | p classes ])including: filter classes
]

{ #category : #parameters }
ScpTraceSourceBrowserItems >> filter: aScpTraceSourceBrowserFilter [

	filter := aScpTraceSourceBrowserFilter
]

{ #category : #private }
ScpTraceSourceBrowserItems >> filter: aCollection including: aString [

	^ aCollection select: [ :e |
		  aString isEmptyOrNil or: [
			  e name asString
				  includesSubstring: aString
				  caseSensitive: false ] ]
]

{ #category : #accessing }
ScpTraceSourceBrowserItems >> methods [

	^ self filter: (selection classes flatCollect: [ :c | c methods ]) including: filter methods
]

{ #category : #accessing }
ScpTraceSourceBrowserItems >> packages [

	^ self filter: Smalltalk packages including: filter packages
]

{ #category : #parameters }
ScpTraceSourceBrowserItems >> selection: aScpTraceSourceBrowserSelection [

	selection := aScpTraceSourceBrowserSelection
]
