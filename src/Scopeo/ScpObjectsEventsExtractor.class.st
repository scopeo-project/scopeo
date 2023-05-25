Class {
	#name : #ScpObjectsEventsExtractor,
	#superclass : #Object,
	#instVars : [
		'objectsEvents',
		'tracer'
	],
	#category : #'Scopeo-ObjectsEventsModel'
}

{ #category : #'building - accessing' }
ScpObjectsEventsExtractor class >> collectFromBlock: aBlock [

	^ (self fromBlock: aBlock) objectsEvents 
]

{ #category : #building }
ScpObjectsEventsExtractor class >> fromBlock: aBlock [

	| debugger |
	debugger := (SeekerDebugger headlessDebugBlock: aBlock).
 	^ self new 
		debuggerTracer: debugger tracer;
		build
]

{ #category : #building }
ScpObjectsEventsExtractor class >> fromBlock: aBlock thenDo: aThenBlock [

	^ self fromBlock: [ 
		aBlock value.
		aThenBlock value.	
	]
]

{ #category : #'api - building' }
ScpObjectsEventsExtractor >> build [

	objectsEvents := ScpObjectsEvents new 
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
ScpObjectsEventsExtractor >> debuggerTracer: aTracer [

	tracer := aTracer
]

{ #category : #'instance creation' }
ScpObjectsEventsExtractor >> fromAssignmentState: aState [

	| variable |
	variable := aState node variable variable.
	^ ScpStateUpdate new
		object: (ScpObjectWrapper fromId: aState receiverOid object: aState receiver);
		method: aState method;
		variable: variable;
		oldValue: (variable readInContext: aState context);
		newValue: aState assignmentNextValue;
		bytecodeIndex: aState bytecodeIndex;
		yourself
]

{ #category : #'instance creation' }
ScpObjectsEventsExtractor >> fromMessageState: aState [

	^ ScpInteraction new
		origin: (ScpObjectWrapper fromId: aState receiverOid object: aState receiver);
		originMethod: aState method;
		destination: (ScpObjectWrapper fromId: aState messageReceiverOid object: aState messageReceiver);
		selector: aState messageSelector;
		arguments: (aState messageArguments ifNil: [ OrderedCollection new ]);
		bytecodeIndex: aState bytecodeIndex;
		yourself
	
]

{ #category : #'instance creation' }
ScpObjectsEventsExtractor >> fromProgramState: aState [
	
	(aState isVariable and: [ aState node isInstanceVariable ]) ifTrue: [ 
		aState isAssignment 
			ifTrue: [ ^ self fromAssignmentState: aState  ] 
			ifFalse: [ ^ self fromReadingState: aState ]
	].
	aState isMessageSend ifTrue: [ ^ self fromMessageState: aState].
]

{ #category : #'instance creation' }
ScpObjectsEventsExtractor >> fromReadingState: aState [

	| object objectId |

	object := aState context receiver.
	objectId := (aState aliasOfObject: object).

	^ ScpStateAccess new
		object: (ScpObjectWrapper fromId: objectId object: object);
		method: aState method;
		variable: aState node variable;
		bytecodeIndex: aState bytecodeIndex;
		yourself
]

{ #category : #initialization }
ScpObjectsEventsExtractor >> initialize [

	objectsEvents := ScpObjectsEvents new
]

{ #category : #accessing }
ScpObjectsEventsExtractor >> objectsEvents [

	^ objectsEvents		
]
