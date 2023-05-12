Class {
	#name : #ScopeoScopeModel,
	#superclass : #Object,
	#instVars : [
		'objects',
		'events',
		'announcer'
	],
	#category : #'Scopeo-UI-Model'
}

{ #category : #accessing }
ScopeoScopeModel >> announcer [

	^ announcer
]

{ #category : #accessing }
ScopeoScopeModel >> getEvent: aName [

	events at: aName
]

{ #category : #accessing }
ScopeoScopeModel >> getEvents [

	^ events associations
]

{ #category : #accessing }
ScopeoScopeModel >> getObject: aName [

	objects at: aName
]

{ #category : #accessing }
ScopeoScopeModel >> getObjects [

	^ objects associations
]

{ #category : #initialization }
ScopeoScopeModel >> initialize [

	objects := Dictionary new.
	events := Dictionary new.
	announcer := Announcer new.
]

{ #category : #notifying }
ScopeoScopeModel >> notifyEventsUpdated [

	self announcer announce: (EventsScopeUpdated new items: self getEvents)
]

{ #category : #notifying }
ScopeoScopeModel >> notifyObjectsUpdated [

	self announcer announce: (ObjectsScopeUpdated new items: self getObjects)
]

{ #category : #modifying }
ScopeoScopeModel >> putEvent: aEvent named: aName [

	events at: aName put: aEvent.
	self notifyEventsUpdated
]

{ #category : #modifying }
ScopeoScopeModel >> putObject: aObject named: aName [

	objects at: aName put: aObject.
	self notifyObjectsUpdated
]

{ #category : #removing }
ScopeoScopeModel >> removeEvent: aName [

	events removeKey: aName.
	self notifyEventsUpdated
]

{ #category : #removing }
ScopeoScopeModel >> removeObject: aName [

	objects removeKey: aName.
	self notifyObjectsUpdated

]
