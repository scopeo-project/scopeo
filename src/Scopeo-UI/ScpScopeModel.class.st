Class {
	#name : #ScpScopeModel,
	#superclass : #Object,
	#instVars : [
		'objects',
		'events',
		'announcer'
	],
	#category : #'Scopeo-UI-Model'
}

{ #category : #accessing }
ScpScopeModel >> announcer [

	^ announcer
]

{ #category : #accessing }
ScpScopeModel >> getEvent: aName [

	^ events at: aName
]

{ #category : #accessing }
ScpScopeModel >> getEvents [

	^ events associations
]

{ #category : #accessing }
ScpScopeModel >> getObject: aName [

	^ objects at: aName
]

{ #category : #accessing }
ScpScopeModel >> getObjects [

	^ objects associations
]

{ #category : #initialization }
ScpScopeModel >> initialize [

	objects := Dictionary new.
	events := Dictionary new.
	announcer := Announcer new.
]

{ #category : #notifying }
ScpScopeModel >> notifyEventsUpdated [

	self announcer announce: (ScpEventsScopeUpdated new items: self getEvents)
]

{ #category : #notifying }
ScpScopeModel >> notifyObjectsUpdated [

	self announcer announce: (ScpObjectsScopeUpdated new items: self getObjects)
]

{ #category : #modifying }
ScpScopeModel >> putEvent: aEvent named: aName [

	events at: aName put: aEvent.
	self notifyEventsUpdated
]

{ #category : #modifying }
ScpScopeModel >> putObject: aObject named: aName [

	objects at: aName put: aObject.
	self notifyObjectsUpdated
]

{ #category : #removing }
ScpScopeModel >> removeEvent: aName [

	events removeKey: aName.
	self notifyEventsUpdated
]

{ #category : #removing }
ScpScopeModel >> removeObject: aName [

	objects removeKey: aName.
	self notifyObjectsUpdated

]
