Class {
	#name : #ScpPresentationModel,
	#superclass : #Object,
	#instVars : [
		'model',
		'bindings',
		'scopeEvents',
		'scopeEventsLabels',
		'scopeSelectedEventsLabel',
		'scopeObjects',
		'scopeObjectsLabels',
		'scopeSelectedObjectsLabel',
		'searchResults',
		'selectedSearchResults'
	],
	#category : #'Scopeo-Presenters'
}

{ #category : #'instance creation' }
ScpPresentationModel class >> on: aModel [

	^ self new model: aModel; yourself
]

{ #category : #scope }
ScpPresentationModel >> addEventsToScope: anEventsCollection withLabel: aLabel [

	self model objects at: aLabel putAll: anEventsCollection.
	self scopeEvents: OrderedCollection empty.
	self scopeEventsLabels: self model getEventsScopes 
]

{ #category : #scope }
ScpPresentationModel >> addObjectsToScope: anObjectCollection withLabel: aLabel [

	self model objects at: aLabel putAll: anObjectCollection.
	self scopeObjects: OrderedCollection empty.
	self scopeObjectsLabels: self model getObjectsScopes
	
]

{ #category : #search }
ScpPresentationModel >> addSelectedSearchResultsToScope [

	| label |
	label := UIManager default request: 'Label'.
	label ifNil: [ self error: 'Cannot add elements to scope without a label.' ].
	self addObjectsToScope: selectedSearchResults withLabel: label
]

{ #category : #binding }
ScpPresentationModel >> bind: anEvent to: aCallbackBlock [

	| callbacks |
	callbacks := bindings
		             at: anEvent
		             ifAbsentPut: [ OrderedCollection empty ].
	callbacks add: aCallbackBlock
]

{ #category : #initialization }
ScpPresentationModel >> initialize [

	bindings := Dictionary new
]

{ #category : #initialization }
ScpPresentationModel >> model [

	^ model
]

{ #category : #initialization }
ScpPresentationModel >> model: aModel [

	model := aModel
]

{ #category : #binding }
ScpPresentationModel >> notifyBindingsOf: anEvent [

	bindings
		at: anEvent
		ifPresent: [ :callbacks | callbacks do: [ :b | b value ] ]
]

{ #category : #binding }
ScpPresentationModel >> notifyBindingsOf: anEvent withArgs: anArguments [

	bindings
		at: anEvent
		ifPresent: [ :callbacks |
		callbacks do: [ :b | b value: anArguments ] ]
]

{ #category : #scope }
ScpPresentationModel >> removeSelectedEventsFromScope [

	self model removeEventsFromScope: scopeSelectedEventsLabel.
	self scopeEvents: OrderedCollection empty.
	self scopeEventsLabels: self model getEventsScopes
]

{ #category : #scope }
ScpPresentationModel >> removeSelectedObjectsFromScope [

	self model removeObjectsFromScope: scopeSelectedObjectsLabel.
	self scopeObjects: OrderedCollection empty.
	self scopeObjectsLabels: self model getObjectsScopes
]

{ #category : #services }
ScpPresentationModel >> scan: aProgram [
]

{ #category : #scope }
ScpPresentationModel >> scopeEvents [

	^ scopeEvents
]

{ #category : #scope }
ScpPresentationModel >> scopeEvents: aScopeEvents [

	scopeEvents := aScopeEvents.
	self notifyBindingsOf: #scopeEvents withArgs: scopeEvents
]

{ #category : #scope }
ScpPresentationModel >> scopeEventsLabels [

	^ scopeEventsLabels
]

{ #category : #scope }
ScpPresentationModel >> scopeEventsLabels: aScopeEventsLabels [

	scopeEventsLabels := aScopeEventsLabels.
	self notifyBindingsOf: #scopeEventsLabels withArgs: scopeEventsLabels
]

{ #category : #scope }
ScpPresentationModel >> scopeObjects: aScopeObjects [

	scopeObjects := aScopeObjects.
	self notifyBindingsOf: #scopeObjects withArgs: scopeObjects
]

{ #category : #scope }
ScpPresentationModel >> scopeObjectsLabels: aScopeObjectsLabels [

	scopeObjectsLabels := aScopeObjectsLabels.
	self notifyBindingsOf: #scopeObjectsLabels withArgs: scopeObjectsLabels
]

{ #category : #scope }
ScpPresentationModel >> scopeSelectedEventsLabel: aScopeSelectedEventsLabel [

	scopeSelectedEventsLabel := aScopeSelectedEventsLabel.
	self scopeEvents: (self model getEventsFromScope: scopeSelectedEventsLabel)
]

{ #category : #scope }
ScpPresentationModel >> scopeSelectedObjectsLabel: aScopeSelectedObjectsLabel [

	scopeSelectedObjectsLabel := aScopeSelectedObjectsLabel.
	self scopeObjects:
		(self model getObjectsFromScope: scopeSelectedObjectsLabel)
]

{ #category : #search }
ScpPresentationModel >> search: aPredicate [

	self notifyBindingsOf: #search
	"^ model search: aPredicate"
]

{ #category : #search }
ScpPresentationModel >> searchResults [

	^ searchResults
]

{ #category : #search }
ScpPresentationModel >> searchResults: aSearchResults [

	searchResults := aSearchResults.
	self notifyBindingsOf: #searchResults withArgs: searchResults
]

{ #category : #search }
ScpPresentationModel >> selectedSearchResults [
^ selectedSearchResults 
]

{ #category : #search }
ScpPresentationModel >> selectedSearchResults: aSelectedSearchResults [

	selectedSearchResults := aSelectedSearchResults.
]
