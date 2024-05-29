Class {
	#name : 'ScpTraceStore',
	#superclass : 'ScpInstrumentationHandler',
	#instVars : [
		'store',
		'index',
		'methodIndex',
		'returnIndex',
		'callStack',
		'storedObjects',
		'storedClasses'
	],
	#category : 'Scopeo',
	#package : 'Scopeo'
}

{ #category : 'initialization' }
ScpTraceStore >> initialize [

	index := 0.
	store := ScpStore new.
	
	callStack := Stack new.
	storedObjects := IdentitySet new.
	storedClasses := IdentitySet new.
]

{ #category : 'events handling' }
ScpTraceStore >> method: aSelector sender: aSender receiver: aReceiver arguments: anArguments [

	index := index + 1.

	store subject: index predicate: #previous object: index -1 .
	store subject: index predicate: #type object: #externalmethodcall.
	store subject: index predicate: #sender object: (self storeObject: aSender).
	store subject: index predicate: #object object: (self storeObject: aReceiver).
	store subject: index predicate: #selector object: aSelector.

	anArguments do: [ :a | 
		store subject: index predicate: #argument object: (self storeObject: a).			
	].

	callStack push: index

]

{ #category : 'events handling' }
ScpTraceStore >> node: aNodeId assignment: aVariable object: anObject value: aValue [

	index := index + 1.
	
	store subject: index predicate: #previous object: index - 1.
	store subject: index predicate: #type object: #objectstate.
	store subject: index predicate: #object object: (self storeObject: anObject).
	store subject: index predicate: #variable object: aVariable.	
	store subject: index predicate: #value object: (self storeObject: aValue).
	store subject: index predicate: #source object: aNodeId.
	
	
]

{ #category : 'events handling' }
ScpTraceStore >> node: aNodeId message: aSelector sender: aSender receiver: aReceiver arguments: anArguments [

	index := index + 1.
		
	store subject: index predicate: #previous object: index - 1.
	store subject: index predicate: #type object: #methodcall.
	store subject: index predicate: #source object: aNodeId.
	store subject: index predicate: #object object: (self storeObject: aReceiver).
	store subject: index predicate: #selector object: aSelector.

	anArguments do: [ :a | 
		store subject: index predicate: #argument object: (self storeObject: a).			
	].

	callStack push: index
]

{ #category : 'events handling' }
ScpTraceStore >> node: aNodeId return: aValue [
	
	store subject: callStack pop predicate: #return object: aValue.
]

{ #category : 'events handling' }
ScpTraceStore >> node: aNodeId super: aSelector sender: aSender arguments: anArguments [

	index := index + 1.
	
	store subject: index predicate: #previous object: index - 1.
	store subject: index predicate: #type object: #supermethodcall.
	store subject: index predicate: #source object: aNodeId.
	store subject: index predicate: #object object: (self storeObject: aSender).
	store subject: index predicate: #selector object: aSelector.
	
	anArguments do: [ :a | 
		store subject: index predicate: #argument object:(self storeObject: a).			
	].
]

{ #category : 'as yet unclassified' }
ScpTraceStore >> store [

	^ store
]

{ #category : 'as yet unclassified' }
ScpTraceStore >> storeClass: aClass [

	(storedObjects includes: aClass name) ifTrue: [ ^ aClass name ].
	store subject: aClass name predicate: #type object: #class.
	aClass allSlots do: [ :s |
		store subject: aClass name predicate: #attribute object: s name.
	].
	storedClasses add: aClass name 
]

{ #category : 'as yet unclassified' }
ScpTraceStore >> storeObject: anObject [

	(storedObjects includes: anObject hash) ifTrue: [ ^ anObject hash ].
	self storeClass: anObject class.
	
	anObject isLiteral ifTrue: [  
		anObject class allSlots do: [ :s | 
			store 
				subject: anObject hash 
				predicate: s name
				object: (self storeObject: (anObject readSlotNamed: s name)).	
		]. 
	].

	storedObjects add: anObject hash.
	^ anObject hash
]
