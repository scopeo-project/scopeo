Class {
	#name : #StatesToObjectsEvents,
	#superclass : #Object,
	#instVars : [
		'objectsEvents',
		'tracer'
	],
	#category : #'Scopeo-Model-Instanciation'
}

{ #category : #'building - accessing' }
StatesToObjectsEvents class >> collectFromBlock: aBlock [

	^ (self fromBlock: aBlock) objectsEvents 
]

{ #category : #building }
StatesToObjectsEvents class >> fromBlock: aBlock [

	| debugger |
	debugger := (SeekerDebugger headlessDebugBlock: aBlock).
 	^ self new 
		debuggerTracer: debugger tracer;
		build
]

{ #category : #building }
StatesToObjectsEvents class >> fromBlock: aBlock thenDo: aThenBlock [

	^ self fromBlock: [ 
		aBlock value.
		aThenBlock value.	
	]
]

{ #category : #'api - building' }
StatesToObjectsEvents >> build [

	objectsEvents := ObjectsEvents new 
		events: 
		(Query
			from: tracer newProgramStates
			select: [ :s | 
				| isExplicitVar isImplicitVarRead |
				isExplicitVar := (s isVariable and: [ s node variable isInstanceVariable ]).
				isImplicitVarRead := s isImplicitReadingOfInstanceVariable.
				isExplicitVar or: [ isImplicitVarRead  or: [ s isMessageSend ]] 
			]
			collect: [ :s | self fromProgramState: s ]) asOrderedCollection
]

{ #category : #'api - building' }
StatesToObjectsEvents >> debuggerTracer: aTracer [

	tracer := aTracer
]

{ #category : #'instance creation' }
StatesToObjectsEvents >> fromAssignmentState: aState [

	| variable objectId |
	variable := aState node variable variable.
	objectId := (aState aliasOfObject: aState context receiver).
	
	^ StateUpdate new
		object: aState context receiver;
		objectId: objectId; 
		method: aState method;
		variable: variable;
		oldValue: (variable readInContext: aState context);
		newValue: aState assignmentNextValue;
		bytecodeIndex: aState bytecodeIndex;
		yourself
]

{ #category : #'instance creation' }
StatesToObjectsEvents >> fromMessageState: aState [

	| originId |
	
	originId := (aState aliasOfObject: aState context receiver).
	
	^ Interaction new
		origin: aState context receiver;
		originId: originId;
		originMethod: aState method;
		destination: aState messageReceiver;
		destinationId: aState messageReceiverOid; 
		selector: aState messageSelector;
		arguments: (aState messageArguments ifNil: [ OrderedCollection new ]);
		bytecodeIndex: aState bytecodeIndex;
		yourself
	
]

{ #category : #'instance creation' }
StatesToObjectsEvents >> fromProgramState: aState [
	
	(aState isVariable and: [ aState node isInstanceVariable ]) ifTrue: [ 
		aState isAssignment 
			ifTrue: [ ^ self fromAssignmentState: aState  ] 
			ifFalse: [ ^ self fromReadingState: aState ]
	].
	aState isMessageSend ifTrue: [ ^ self fromMessageState: aState].
]

{ #category : #'instance creation' }
StatesToObjectsEvents >> fromReadingState: aState [

	| variable objectId |
	variable := aState node variable.
	objectId := (aState aliasOfObject: aState context receiver).
	
	^ StateAccess new
		object: aState context receiver;
		objectId: objectId; 
		method: aState method;
		variable: variable;
		bytecodeIndex: aState bytecodeIndex;
		yourself
]

{ #category : #initialization }
StatesToObjectsEvents >> initialize [

	objectsEvents := ObjectsEvents new
]

{ #category : #accessing }
StatesToObjectsEvents >> objectsEvents [

	^ objectsEvents		
]
