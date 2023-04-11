Class {
	#name : #ObjectGraphBuilder,
	#superclass : #Object,
	#instVars : [
		'graph',
		'programStates',
		'vertices',
		'index'
	],
	#category : #'Scopeo-Graph'
}

{ #category : #building }
ObjectGraphBuilder class >> buildFromBlock: aBlock [

	| debugger |
	debugger := (SeekerDebugger headlessDebugBlock: aBlock).
 	^ self new 
		debuggerTracer: debugger tracer;
		build
]

{ #category : #building }
ObjectGraphBuilder class >> buildFromBlock: aBlock thenDo: aThenBlock [

	^ self buildFromBlock: [ 
		aBlock value.
		aThenBlock value.	
	]
]

{ #category : #private }
ObjectGraphBuilder >> addAssignment: aAssignment [
	
	| vertex action |
	
	vertex := self
		vertexAt: aAssignment objectOid 
		for: aAssignment object.
		
	action := ObjectGraphAssignment new
		bytecodeIndex: aAssignment bytecodeIndex;
		variable: aAssignment variable;
		oldValue: aAssignment oldValue; 
		newValue: aAssignment newValue.
	
	graph addEdge: (ObjectGraphEdge new 
		index: index;
		origin: vertex; 
		action: action; 
		destination: vertex).
		
	index := index + 1.
]

{ #category : #private }
ObjectGraphBuilder >> addMessage: aMessage [
	
	| origin action destination |
	
	origin := self 
		vertexAt: aMessage senderOid
		for: aMessage sender.
		
	action := ObjectGraphMessage new
		pc: aMessage pc;
		bytecodeIndex: aMessage bytecodeIndex;
		selector: aMessage selector;
		arguments: aMessage arguments.
	
	destination := self 
		vertexAt: aMessage receiverOid
		for: aMessage receiver.
	
	graph addEdge: (ObjectGraphEdge new 
		index: index;
		origin: origin; 
		action: action; 
		destination: destination).
		
	index := index + 1.
]

{ #category : #'api - building' }
ObjectGraphBuilder >> build [
	
	index := 0.
	
	(Query
		from: programStates
		select: [ :s | s nodeIsAssignmentOfInstanceVariable or: [ s isMessageSend ] ]
		collect: [ :s | 
			| ps |
			ps := Trace fromSeekerPS: s.
			ps isAssignment ifTrue: [ self addAssignment: ps ].
   			ps isMessage ifTrue: [ self addMessage: ps ]
		 ]) asOrderedCollection.
	^ graph
]

{ #category : #'api - building' }
ObjectGraphBuilder >> debuggerTracer: aTracer [

	programStates := aTracer newProgramStates.
]

{ #category : #initialization }
ObjectGraphBuilder >> initialize [

	graph := ObjectGraph new.
	vertices := Dictionary new.


]

{ #category : #private }
ObjectGraphBuilder >> vertexAt: aObjectOid for: aObject [ 
	
	^ vertices at: aObjectOid ifAbsentPut: [
		ObjectGraphVertex new 
			objectOid: aObjectOid;
			object: aObject.
	]
	
]
