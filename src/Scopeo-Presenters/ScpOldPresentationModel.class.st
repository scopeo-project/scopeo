Class {
	#name : #ScpOldPresentationModel,
	#superclass : #ScpPresentationModel,
	#instVars : [
		'model',
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
ScpOldPresentationModel class >> on: aModel [

	^ self new model: aModel; yourself
]

{ #category : #scope }
ScpOldPresentationModel >> addEventsToScope: anEventsCollection withLabel: aLabel [

	self model addEvents: anEventsCollection toScope: aLabel.
	self scopeEvents: OrderedCollection empty.
	self scopeEventsLabels: self model getEventsScopes
]

{ #category : #scope }
ScpOldPresentationModel >> addObjectsToScope: anObjectCollection withLabel: aLabel [

	self model addObjects: anObjectCollection toScope: aLabel.
	self scopeObjects: OrderedCollection empty.
	self scopeObjectsLabels: self model getObjectsScopes
]

{ #category : #search }
ScpOldPresentationModel >> addSelectedSearchResultsToScope [

	| label |
	label := UIManager default request: 'Label'.
	label ifNil: [
		self error: 'Cannot add elements to scope without a label.' ].
	self addEventsToScope: selectedSearchResults withLabel: label
]

{ #category : #initialization }
ScpOldPresentationModel >> model [

	^ model
]

{ #category : #initialization }
ScpOldPresentationModel >> model: aModel [

	model := aModel
]

{ #category : #scope }
ScpOldPresentationModel >> removeSelectedEventsFromScope [

	self model removeEventsFromScope: scopeSelectedEventsLabel.
	self scopeEvents: OrderedCollection empty.
	self scopeEventsLabels: self model getEventsScopes
]

{ #category : #scope }
ScpOldPresentationModel >> removeSelectedObjectsFromScope [

	self model removeObjectsFromScope: scopeSelectedObjectsLabel.
	self scopeObjects: OrderedCollection empty.
	self scopeObjectsLabels: self model getObjectsScopes
]

{ #category : #services }
ScpOldPresentationModel >> scan: aProgram [
]

{ #category : #scope }
ScpOldPresentationModel >> scopeEvents [

	^ scopeEvents
]

{ #category : #scope }
ScpOldPresentationModel >> scopeEvents: aScopeEvents [

	scopeEvents := aScopeEvents.
	self notifyBindingsOf: #scopeEvents withArgs: scopeEvents
]

{ #category : #scope }
ScpOldPresentationModel >> scopeEventsLabels [

	^ scopeEventsLabels
]

{ #category : #scope }
ScpOldPresentationModel >> scopeEventsLabels: aScopeEventsLabels [

	scopeEventsLabels := aScopeEventsLabels.
	self notifyBindingsOf: #scopeEventsLabels withArgs: scopeEventsLabels
]

{ #category : #scope }
ScpOldPresentationModel >> scopeObjects: aScopeObjects [

	scopeObjects := aScopeObjects.
	self notifyBindingsOf: #scopeObjects withArgs: scopeObjects
]

{ #category : #scope }
ScpOldPresentationModel >> scopeObjectsLabels: aScopeObjectsLabels [

	scopeObjectsLabels := aScopeObjectsLabels.
	self notifyBindingsOf: #scopeObjectsLabels withArgs: scopeObjectsLabels
]

{ #category : #scope }
ScpOldPresentationModel >> scopeSelectedEventsLabel: aScopeSelectedEventsLabelIndex [

	scopeSelectedEventsLabel := scopeEventsLabels at: aScopeSelectedEventsLabelIndex.
	self scopeEvents: (self model getEventsFromScope: scopeSelectedEventsLabel)
]

{ #category : #scope }
ScpOldPresentationModel >> scopeSelectedObjectsLabel: aScopeSelectedObjectsLabelIndex [

	scopeSelectedObjectsLabel := scopeObjectsLabels at: aScopeSelectedObjectsLabelIndex.
	self scopeObjects: (self model getObjectsFromScope: scopeSelectedObjectsLabel)
]

{ #category : #search }
ScpOldPresentationModel >> search: aPredicate [

	self searchResults: (model search: aPredicate)
]

{ #category : #search }
ScpOldPresentationModel >> searchResults [

	^ searchResults
]

{ #category : #search }
ScpOldPresentationModel >> searchResults: aSearchResults [

	searchResults := aSearchResults.
	self notifyBindingsOf: #searchResults withArgs: searchResults
]

{ #category : #search }
ScpOldPresentationModel >> selectedSearchResults [
^ selectedSearchResults 
]

{ #category : #search }
ScpOldPresentationModel >> selectedSearchResults: aSelectedSearchResultsIndexes [

	selectedSearchResults := aSelectedSearchResultsIndexes collect: [ :i | searchResults at: i] 
]
