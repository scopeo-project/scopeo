Class {
	#name : #ScpScopeImpl,
	#superclass : #MolAbstractComponentImpl,
	#traits : 'ScpScope + ScpScopeServices',
	#classTraits : 'ScpScope classTrait + ScpScopeServices classTrait',
	#instVars : [
		'events',
		'objects'
	],
	#category : #'Scopeo-Scope'
}

{ #category : #accessing }
ScpScopeImpl >> at: aKey putObject: anObject [

	self at: aKey putObject: { anObject }
]

{ #category : #accessing }
ScpScopeImpl >> at: aKey putObjectEvent: anObjectEvent [

	self at: aKey putObjectEvents: { anObjectEvent }
]

{ #category : #adding }
ScpScopeImpl >> at: aKey putObjectEvents: anObjectEventsCollection [

	events
		at: aKey
		ifPresent: [ :items | items addAll: anObjectEventsCollection ]
		ifAbsentPut: [ anObjectEventsCollection ].
	
	self getScpScopeEventsProvider addedObjectEvents:  anObjectEventsCollection to: (events associationAt: aKey) 
]

{ #category : #adding }
ScpScopeImpl >> at: aKey putObjects: anObjectCollection [

	objects
		at: aKey
		ifPresent: [ :items | items addAll: anObjectCollection ]
		ifAbsentPut: [ anObjectCollection ].

	self getScpScopeEventsProvider
		addedObjects: anObjectCollection
		to: (objects associationAt: aKey)
]

{ #category : #adding }
ScpScopeImpl >> getObjectAt: aKey [

	^ (self getObjectsAt: aKey) first
]

{ #category : #adding }
ScpScopeImpl >> getObjectEventAt: aKey [

	^ (self getObjectEventsAt: aKey) first
]

{ #category : #adding }
ScpScopeImpl >> getObjectEventsAt: aKey [

	^ events at: aKey
]

{ #category : #accessing }
ScpScopeImpl >> getObjectEventsKeys [

	^ events keys
]

{ #category : #adding }
ScpScopeImpl >> getObjectsAt: aKey [

	^ objects at: aKey
]

{ #category : #accessing }
ScpScopeImpl >> getObjectsKeys [

	^ objects keys
]

{ #category : #'component accessing' }
ScpScopeImpl >> getScpScopeEventsProvider [
	| parametersSymbol parametersProvider itf |

	itf := ScpScopeEvents.
	parametersSymbol := self parametersProviders at: itf ifAbsent: [nil].
	(parametersSymbol isNil or:[parametersSymbol isSymbol not]) ifTrue: [ ^ MolNotFoundParametersProvider new interface: itf name: nil ].

	parametersProvider := MolComponentManager default locatorServices searchParametersProviderFor: ScpScopeEvents named: parametersSymbol.
	^parametersProvider
]

{ #category : #initialization }
ScpScopeImpl >> initialize [

	events := Dictionary new.
	objects := Dictionary new
]

{ #category : #adding }
ScpScopeImpl >> removeObjectEventsAt: aKey [

	events removeKey: aKey
]

{ #category : #adding }
ScpScopeImpl >> removeObjectsAt: aKey [

	objects removeKey: aKey
]
