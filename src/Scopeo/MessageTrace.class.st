Class {
	#name : #MessageTrace,
	#superclass : #Trace,
	#instVars : [
		'sender',
		'method',
		'receiver',
		'selector',
		'arguments',
		'senderOid',
		'receiverOid'
	],
	#category : #'Scopeo-Trace'
}

{ #category : #'instance creation' }
MessageTrace class >> fromSeekerPS: aProgramState [

	| senderOid |
	
	senderOid := (aProgramState aliasOfObject: aProgramState context receiver).
	
	^ self new
        pc: aProgramState contextPC;
	     bytecodeIndex: aProgramState bytecodeIndex;
		  senderOid: senderOid;
		  sender: aProgramState context receiver;
		  method: aProgramState method;
		  receiverOid: aProgramState messageReceiverOid; 
		  receiver: aProgramState messageReceiver;
		  selector: aProgramState messageSelector;
		  arguments: aProgramState messageArguments;
		  seekerProgramState: aProgramState copy
]

{ #category : #accessing }
MessageTrace >> arguments [

	^ arguments
]

{ #category : #accessing }
MessageTrace >> arguments: anObject [

	arguments := anObject
]

{ #category : #testing }
MessageTrace >> isMessage [

	^ true
]

{ #category : #accessing }
MessageTrace >> method [

	^ method
]

{ #category : #accessing }
MessageTrace >> method: anObject [

	method := anObject
]

{ #category : #accessing }
MessageTrace >> receiver [

	^ receiver
]

{ #category : #accessing }
MessageTrace >> receiver: anObject [

	receiver := anObject
]

{ #category : #accessing }
MessageTrace >> receiverOid [

	^ receiverOid
]

{ #category : #accessing }
MessageTrace >> receiverOid: anObject [

	receiverOid := anObject
]

{ #category : #accessing }
MessageTrace >> selector [

	^ selector
]

{ #category : #accessing }
MessageTrace >> selector: anObject [

	selector := anObject
]

{ #category : #accessing }
MessageTrace >> sender [

	^ sender
]

{ #category : #accessing }
MessageTrace >> sender: anObject [

	sender := anObject
]

{ #category : #accessing }
MessageTrace >> senderOid [

	^ senderOid
]

{ #category : #accessing }
MessageTrace >> senderOid: anObject [

	senderOid := anObject
]
