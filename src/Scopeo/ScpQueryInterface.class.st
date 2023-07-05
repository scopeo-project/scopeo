Class {
	#name : #ScpQueryInterface,
	#superclass : #Object,
	#instVars : [
		'state'
	],
	#category : #'Scopeo-Logic'
}

{ #category : #'instance creation' }
ScpQueryInterface class >> newFrom: aSkProgramState [

	^ self new
		  skProgramState: aSkProgramState;
		  yourself
]

{ #category : #accessing }
ScpQueryInterface >> arguments [

	^ state messageArguments ifNil: [ OrderedCollection new ]
]

{ #category : #accessing }
ScpQueryInterface >> destination [

	^ ScpObjectWrapper fromId: state messageReceiverOid object: state messageReceiver
]

{ #category : #testing }
ScpQueryInterface >> isInteraction [

	^ state isMessageSend
]

{ #category : #testing }
ScpQueryInterface >> isStateAccess [

	^ self isStateEvent and: [ state isAssignment not ]
]

{ #category : #testing }
ScpQueryInterface >> isStateEvent [
	^ state isVariable and: [ state node isInstanceVariable ]
]

{ #category : #testing }
ScpQueryInterface >> isStateUpdate [

	^ self isStateEvent and: [ state isAssignment ]
]

{ #category : #accessing }
ScpQueryInterface >> method [

	^ state method
]

{ #category : #accessing }
ScpQueryInterface >> newValue [

	^ state assignmentNextValue
]

{ #category : #accessing }
ScpQueryInterface >> object [

	^ self origin
]

{ #category : #accessing }
ScpQueryInterface >> oldValue [

	^ self variable readInContext: state context
]

{ #category : #accessing }
ScpQueryInterface >> origin [

	^ ScpObjectWrapper
				   fromId: state receiverOid
				   object: state receiver.
]

{ #category : #accessing }
ScpQueryInterface >> selector [

	^ state messageSelector
]

{ #category : #initialization }
ScpQueryInterface >> skProgramState: aState [

	state := aState
]

{ #category : #accessing }
ScpQueryInterface >> timeTravelIndex [

	^ state bytecodeIndex
]

{ #category : #converting }
ScpQueryInterface >> toEvent [

	self isStateAccess ifTrue: [ ^ self toStateAccessEvent ].
	self isStateUpdate ifTrue: [ ^ self toStateUpdateEvent ].
	self isInteraction ifTrue: [ ^ self toInteractionEvent ]
]

{ #category : #converting }
ScpQueryInterface >> toInteractionEvent [

	^ ScpInteraction new
		  origin: self origin;
		  method: self method;
		  destination: self destination;
		  selector: self selector;
		  arguments: self arguments;
		  timeTravelIndex: self timeTravelIndex;
		  yourself
]

{ #category : #converting }
ScpQueryInterface >> toStateAccessEvent [

	^ ScpStateAccess new
		  object: self object;
		  method: self method;
		  variable: self variable;
		  timeTravelIndex: self timeTravelIndex;
		  yourself
]

{ #category : #converting }
ScpQueryInterface >> toStateUpdateEvent [

	^ ScpStateUpdate new
		  object: self object;
		  method: self method;
		  variable: self variable;
		  oldValue: self oldValue;
		  newValue: self newValue;
		  timeTravelIndex: self timeTravelIndex;
		  yourself
]

{ #category : #accessing }
ScpQueryInterface >> variable [

	^ state node variable
]
