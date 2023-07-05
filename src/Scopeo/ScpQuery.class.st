Class {
	#name : #ScpQuery,
	#superclass : #Object,
	#instVars : [
		'tracer',
		'predicate',
		'scope'
	],
	#category : #'Scopeo-Query'
}

{ #category : #'api - building' }
ScpQuery >> block: aBlock predicate: aPredicate scope: aScope [

	self
		debugger: (SeekerDebugger headlessDebugBlock: aBlock)
		predicate: aPredicate
		scope: aScope
]

{ #category : #'api - building' }
ScpQuery >> debugger: aDebugger predicate: aPredicate scope: aScope [

	self tracer:  aDebugger tracer predicate: aPredicate  scope: aScope
]

{ #category : #executing }
ScpQuery >> execute [

	^ (Query
		   from: tracer newProgramStates
		   select: [ :s |
		   predicate verify: (ScpQueryInterface newFrom: s) scope: scope ]
		   collect: [ :s | (ScpQueryInterface newFrom: s) toEvent ])
		  asOrderedCollection
]

{ #category : #'api - building' }
ScpQuery >> tracer: aTracer predicate: aPredicate scope: aScope [

	tracer := aTracer.
	predicate := aPredicate.
	scope := aScope

]
