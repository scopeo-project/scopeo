Class {
	#name : #ScpScopeImplTest,
	#superclass : #TestCase,
	#category : #'Scopeo-Tests'
}

{ #category : #tests }
ScpScopeImplTest >> testAtPutObject [

	| scope |
	scope := ScpScopeImpl new.
	scope at: 'test' putObject: 'testobject'.

	self assert: scope getObjectsKeys size equals: 1.
	self assert: (scope getObjectAt: 'test') equals: 'testobject'
]

{ #category : #tests }
ScpScopeImplTest >> testAtPutObjectEvent [

	| scope |
	scope := ScpScopeImpl new.
	scope at: 'test' putObjectEvent: 'testevent'.

	self assert: scope getObjectEventsKeys  size equals: 1.
	self assert: (scope getObjectEventAt: 'test') equals: 'testevent'
]

{ #category : #tests }
ScpScopeImplTest >> testAtPutObjectEvents [

	| scope |
	scope := ScpScopeImpl new.
	scope at: 'test' putObjectEvents: { 'testevent' }.

	self assert: scope getObjectEventsKeys size equals: 1.
	self
		assert: (scope getObjectEventsAt: 'test') first
		equals: 'testevent'
]

{ #category : #tests }
ScpScopeImplTest >> testAtPutObjects [

	| scope |
	scope := ScpScopeImpl new.
	scope at: 'test' putObjects: { 'testobject' }.

	self assert: scope getObjectsKeys size equals: 1.
	self assert: (scope getObjectsAt: 'test') first equals: 'testobject'
]

{ #category : #tests }
ScpScopeImplTest >> testRemoveObjectEventsAt [

	| scope |
	scope := ScpScopeImpl new.
	scope at: 'test' putObjectEvents: { 'testevent' }.

	scope removeObjectEventsAt: 'test'.

	self assert: scope getObjectEventsKeys size equals: 0
]

{ #category : #tests }
ScpScopeImplTest >> testRemoveObjectsAt [
	
	| scope |
	scope := ScpScopeImpl new.
	scope at: 'test' putObjects: { 'testobject' }.

	scope removeObjectsAt: 'test'.

	self assert: scope getObjectsKeys size equals: 0.
	
]
