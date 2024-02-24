Class {
	#name : #ScpTraceSourceBrowserItemsUpdateEvent,
	#superclass : #Announcement,
	#instVars : [
		'items'
	],
	#category : #'Scopeo-TraceRecorder-Source-Browser-UI'
}

{ #category : #accessing }
ScpTraceSourceBrowserItemsUpdateEvent >> items [

	^ items
]

{ #category : #accessing }
ScpTraceSourceBrowserItemsUpdateEvent >> items: aScpTraceSourceBrowserItems [

	items := aScpTraceSourceBrowserItems
]
