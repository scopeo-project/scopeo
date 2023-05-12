Class {
	#name : #ScpScopeUpdated,
	#superclass : #Announcement,
	#instVars : [
		'items'
	],
	#category : #'Scopeo-UI-Model'
}

{ #category : #accessing }
ScpScopeUpdated >> items [

	^ items
]

{ #category : #accessing }
ScpScopeUpdated >> items: anObject [

	items := anObject
]
