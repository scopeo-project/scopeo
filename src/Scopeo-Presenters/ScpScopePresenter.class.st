Class {
	#name : 'ScpScopePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'objectKeys',
		'objectValues',
		'eventKeys',
		'eventValues',
		'model',
		'removeObjects',
		'removeEvents'
	],
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'accessing - method dictionary' }
ScpScopePresenter class >> addAndClassifySelector: selector withMethod: compiledMethod inProtocol: aCategory [

	"When a new methods is added, I add it to the localMethodDict and also propagate the changes to my users"
	self localMethodDict at: selector put: compiledMethod.

	super
		addAndClassifySelector: selector
		withMethod: compiledMethod
		inProtocol: aCategory.

	TraitChange addSelector: selector on: self.
]

{ #category : 'accessing - method dictionary' }
ScpScopePresenter class >> addSelector: selector withMethod: compiledMethod [
	"When a new selector is installed in a class I insert the selector in the local methodDict and propagate the changes to my users"

	self localMethodDict at: selector put: compiledMethod.
	super addSelector: selector withMethod: compiledMethod.
	TraitChange addSelector: selector on: self
]

{ #category : 'accessing - method dictionary' }
ScpScopePresenter class >> addSelector: selector withRecompiledMethod: compiledMethod [
	"When a new selector is installed in a class I insert the selector in the local methodDict and propagate the changes to my users"

	compiledMethod isFromTrait
		ifTrue: [ ^ super addSelector: selector withRecompiledMethod: compiledMethod ].

	self localMethodDict at: selector put: compiledMethod.
	super addSelector: selector withRecompiledMethod: compiledMethod.
	TraitChange addSelector: selector on: self
]

{ #category : 'querying' }
ScpScopePresenter class >> allTraits [
	^ self traitComposition allTraits
]

{ #category : 'initialization' }
ScpScopePresenter class >> doRebuildMethodDictionary [
	| selectors removedSelectors removeFromOrganization modified|

	"During the creation of the class or after a change in the traitComposition, the whole method dictionary is calculated.
	If I return true, my users should be updated"

	"1. I recreate the local methodDict"
	modified := false.
	self methodDict valuesDo: [ :m | m traitSource ifNil: [ self localMethodDict at: m selector put: m ]].

	"2. I filter the selectors from the trait composition, rejecting the ones that are locally defined.
	And then I install the methods in myself. The trait composition only install the method if it is needed."
	selectors := self traitComposition selectors reject: [ :e | (self localMethodDict includesKey: e) ].
	selectors do: [ :e | modified := modified | (self traitComposition installSelector: e into: self replacing: false)].

	"3. I handle the methods that I have and they are no more in the traitComposition."
	removedSelectors := self methodDict keys reject: [ :aSelector | (selectors includes: aSelector) or: [ self localMethodDict includesKey: aSelector] ].
	modified := modified | (removedSelectors isNotEmpty).
	removedSelectors do: [ :aSelector | self methodDict removeKey: aSelector ].

	"4. Finally, I remove these methods from my class organization"
	removeFromOrganization := self organization allMethodSelectors reject: [:e | self methodDict includesKey: e ].
	removeFromOrganization do: [ :aSelector | self organization removeElement: aSelector ].

	^ modified
]

{ #category : 'testing' }
ScpScopePresenter class >> findOriginClassOf: aMethod [

	"I return the myself or the trait that has the original implementation of a method.
	If the method is an alias, the returned class includes the original aliased method"

	(aMethod hasProperty: #traitSource)
		ifTrue: [ ^ aMethod traitSource innerClass ].

	(self includesLocalSelector: aMethod selector)
		ifTrue: [ ^ self ].

	^ (self traitComposition traitDefining: aMethod selector ifNone: [ ^ self ]) innerClass
]

{ #category : 'testing' }
ScpScopePresenter class >> findOriginMethodOf: aMethod [

	"I return the original method for a aMethod.
	If this is a local method, the original method is itself.
	If it cames from a trait composition I look for the method in the trait composition.
	First I try with the trait stored in the traitSource.
	If it is an aliased or conflicting method, the method is look up in the whole trait composition"

	(self includesLocalSelector: aMethod selector)
		ifTrue: [ ^ aMethod ].

	(aMethod hasProperty: #traitSource)
		ifTrue: [ |newSelector|
			newSelector := self traitComposition originSelectorOf: aMethod selector.
			^ aMethod traitSource compiledMethodAt: newSelector ifAbsent: [aMethod] ].

	^ (self traitComposition traitDefining: aMethod selector ifNone: [ self ])
		compiledMethodAt: aMethod selector ifAbsent: [ ^ aMethod ]
]

{ #category : 'testing' }
ScpScopePresenter class >> hasTraitComposition [

	^ self traitComposition isEmpty not
]

{ #category : 'testing' }
ScpScopePresenter class >> includesLocalSelector: aSymbol [
	^ self isLocalSelector: aSymbol
]

{ #category : 'testing' }
ScpScopePresenter class >> isAliasSelector: aSymbol [
	"Return true if the selector aSymbol is an alias defined
	in my or in another composition somewhere deeper in
	the tree of traits compositions."

	^ self traitComposition isAliasSelector: aSymbol
]

{ #category : 'testing' }
ScpScopePresenter class >> isLocalAliasSelector: aSymbol [
	"Return true if the selector aSymbol is an alias defined
	in my trait composition."

	^ self traitComposition isLocalAliasSelector: aSymbol
]

{ #category : 'testing' }
ScpScopePresenter class >> isLocalMethodsProtocol: aProtocol [
	"Checks if the protocol has local selectors"

	aProtocol methodSelectors ifEmpty: [ ^ true ].
	^ aProtocol methodSelectors anySatisfy: [ :each | self isLocalSelector: each ]
]

{ #category : 'testing' }
ScpScopePresenter class >> isLocalSelector: aSelector [

	^ self localMethodDict includesKey: aSelector
]

{ #category : 'accessing' }
ScpScopePresenter class >> localMethodDict [
	"The local methodDict is in the metaclass. In this way I do not have to recompile the methods during the bootstrap when we don't have a compiler."
	^ self class baseLocalMethods
]

{ #category : 'accessing' }
ScpScopePresenter class >> localMethodDict: aMethodDictionary [
	^ self class baseLocalMethods: aMethodDictionary
]

{ #category : 'accessing' }
ScpScopePresenter class >> localMethods [
	"returns the methods of classes excluding the ones of the traits that the class uses"

	^ self localMethodDict values
]

{ #category : 'accessing - method dictionary' }
ScpScopePresenter class >> localSelectors [

	^ self localMethodDict keys
]

{ #category : 'initialization' }
ScpScopePresenter class >> rebuildMethodDictionary [

	"Useful to be rewritten in Traits"
	^ self doRebuildMethodDictionary
]

{ #category : 'categories' }
ScpScopePresenter class >> recategorizeSelector: selector from: oldCategory to: newCategory [
	| original |

	"When a method is recategorized I have to classify the method, but also recategorize the aliases pointing to it"

	original := self organization categoryOfElement: selector ifAbsent: [ ^ self ].

	"If it is nil is because it is a removal. It will removed when the method is removed."
	newCategory ifNil: [ ^ self ].

	original = oldCategory
		ifTrue: [ self organization classify: selector under: newCategory suppressIfDefault: true ].

	(self traitComposition reverseAlias: selector) do: [ :e |
		self recategorizeSelector: e from: oldCategory to: newCategory.
		self notifyOfRecategorizedSelector: e from: oldCategory to: newCategory ].

	self organization removeEmptyCategories
]

{ #category : 'recompilation' }
ScpScopePresenter class >> recompile: selector from: oldClass [
	"Compile the method associated with selector in the receiver's method dictionary."

	| method newMethod |
	method := oldClass compiledMethodAt: selector.
	newMethod := self compiler
				source: (oldClass sourceCodeAt: selector);
				class: self;
				failBlock: [^ self];
				compiledMethodTrailer: method trailer;
				compile.   "Assume OK after proceed from SyntaxError"
	selector == newMethod selector ifFalse: [self error: 'selector changed!'].

	method properties
		at: #traitSource
		ifPresent: [ :aSource | newMethod propertyAt: #traitSource put: aSource].

	self addSelector: selector withRecompiledMethod: newMethod
]

{ #category : 'trait-composition' }
ScpScopePresenter class >> removeFromComposition: aTrait [

	self setTraitComposition: (self traitComposition copyWithoutTrait: aTrait asTraitComposition)
]

{ #category : 'removing' }
ScpScopePresenter class >> removeFromSystem: logged [

	"When a traited class is removed the traits it is using should be updated"
	| mySubclasses |
	self traitComposition removeUser: self.
	self class traitComposition removeUser: self class.

	TraitedClass removeUser: self class.

	mySubclasses := self subclasses.

	super removeFromSystem: logged.

	"As I am a traited class my subclasses does not have the basic traited class
	methods, so I add them."
	mySubclasses do: [ :each | each class initializeBasicMethods ]
]

{ #category : 'removing' }
ScpScopePresenter class >> removeSelector: aSelector [

	"When a selector is removed it should be notified to my users.
	Check the class TraitChange for more details"
	super removeSelector: aSelector.
	self localMethodDict removeKey: aSelector ifAbsent: [  ].

	TraitChange removeSelector: aSelector on: self
]

{ #category : 'accessing' }
ScpScopePresenter class >> traitComposition [
	"My trait composition is in my class. So I do not need to recompile the methods when installing them during bootstrap"
	^ self class baseComposition
]

{ #category : 'accessing' }
ScpScopePresenter class >> traitComposition: aComposition [

	aComposition asTraitComposition allTraits do: [ :aMaybeTrait |
		aMaybeTrait isTrait ifFalse: [
			self error: 'All the members of the trait composition should be traits' ]].

	self class baseComposition: aComposition
]

{ #category : 'accessing' }
ScpScopePresenter class >> traitCompositionString [
	^ self traitComposition asString
]

{ #category : 'accessing' }
ScpScopePresenter class >> traitUsers [
	"I am a traited class, I have no users, this is for compatibility with traits"
	^ #()
]

{ #category : 'accessing' }
ScpScopePresenter class >> traits [
	^ self traitComposition traits
]

{ #category : 'initialization' }
ScpScopePresenter >> connectPresenters [

	objectKeys whenSelectionChangedDo: [ :selection | 
		selection selectedIndexes ifNotEmpty: [ :ids | model scopeSelectedObjectsLabel: ids first ] ].
	eventKeys whenSelectionChangedDo: [ :selection | 
		selection selectedIndexes ifNotEmpty: [ :ids | model scopeSelectedEventsLabel: ids first ] ].

	removeObjects action: [ model removeSelectedObjectsFromScope ].
	removeEvents action: [ model removeSelectedEventsFromScope ].

	model
		bind: #scopeObjectsLabels
		to: [ :labels | objectKeys items: labels ].
	model
		bind: #scopeEventsLabels
		to: [ :labels | eventKeys items: labels ].
	model
		bind: #scopeObjects
		to: [ :objects | objectValues items: objects ].
	model
		bind: #scopeEvents
		to: [ :events | eventValues items: events ]
]

{ #category : 'layout' }
ScpScopePresenter >> defaultLayout [

	^ SpPanedLayout newHorizontal
		  add: (SpBoxLayout newVertical
				   add: 'Scope - set of objects' height: 15;
				   add: objectKeys;
				   add: 'Scope - set of events' height: 15;
				   add: eventKeys;
				   spacing: 8;
				   yourself);
		  add: (SpBoxLayout newVertical
				   add: 'Scope - objects' height: 15;
				   add: objectValues;
				   add: 'Scope - events' height: 15;
				   add: eventValues;
				   spacing: 8;
				   yourself);
			positionOfSlider: 0.3;
		  yourself
]

{ #category : 'initialization' }
ScpScopePresenter >> initializePresenters [

	objectKeys := self newList.
	eventKeys := self newList.
	objectValues := self newList
		                beMultipleSelection;
		                yourself.
	eventValues := self newList
		               beMultipleSelection;
		               yourself.

	removeObjects := self newButton
		                 icon: (self iconNamed: #remove);
		                 yourself.
	removeEvents := self newButton
		                icon: (self iconNamed: #remove);
		                yourself
]

{ #category : 'accessing - model' }
ScpScopePresenter >> setModelBeforeInitialization: aDomainObject [

	model := aDomainObject
]
