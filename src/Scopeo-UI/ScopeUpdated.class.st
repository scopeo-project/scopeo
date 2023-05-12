Class {
	#name : #ScopeUpdated,
	#superclass : #Announcement,
	#instVars : [
		'items'
	],
	#category : #'Scopeo-UI-Model'
}

{ #category : #accessing }
ScopeUpdated >> items [

	^ items
]

{ #category : #accessing }
ScopeUpdated >> items: anObject [

	items := anObject
]
