Class {
	#name : #ScpTraceSourceBrowserFilter,
	#superclass : #Object,
	#instVars : [
		'packages',
		'classes',
		'methods',
		'model'
	],
	#category : #'Scopeo-TraceRecorder-Source-Browser-UI'
}

{ #category : #accessing }
ScpTraceSourceBrowserFilter >> classes [

	^ classes
]

{ #category : #accessing }
ScpTraceSourceBrowserFilter >> classes: anObject [

	classes := anObject.
	model announceUpdate.
]

{ #category : #initialization }
ScpTraceSourceBrowserFilter >> initialize [

	packages := String empty.
	classes := String empty.
	methods := String empty
]

{ #category : #accessing }
ScpTraceSourceBrowserFilter >> methods [

	^ methods
]

{ #category : #accessing }
ScpTraceSourceBrowserFilter >> methods: anObject [

	methods := anObject.
	model announceUpdate
]

{ #category : #accessing }
ScpTraceSourceBrowserFilter >> model: aScpTraceSourceBrowserPresentationModel [

	model := aScpTraceSourceBrowserPresentationModel
]

{ #category : #accessing }
ScpTraceSourceBrowserFilter >> packages [

	^ packages
]

{ #category : #accessing }
ScpTraceSourceBrowserFilter >> packages: anObject [

	packages := anObject.
	model announceUpdate
]
