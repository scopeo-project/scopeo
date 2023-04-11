Class {
	#name : #OgMessagePS,
	#superclass : #OgProgramState,
	#instVars : [
		'sender',
		'method',
		'receiver',
		'selector',
		'arguments',
		'senderOid',
		'receiverOid'
	],
	#category : #'Scopeo-Model-ProgramState'
}

{ #category : #'instance creation' }
OgMessagePS class >> fromSeekerPS: aProgramState [

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
OgMessagePS >> arguments [

	^ arguments
]

{ #category : #accessing }
OgMessagePS >> arguments: anObject [

	arguments := anObject
]

{ #category : #testing }
OgMessagePS >> isMessage [

	^ true
]

{ #category : #accessing }
OgMessagePS >> method [

	^ method
]

{ #category : #accessing }
OgMessagePS >> method: anObject [

	method := anObject
]

{ #category : #accessing }
OgMessagePS >> receiver [

	^ receiver
]

{ #category : #accessing }
OgMessagePS >> receiver: anObject [

	receiver := anObject
]

{ #category : #accessing }
OgMessagePS >> receiverOid [

	^ receiverOid
]

{ #category : #accessing }
OgMessagePS >> receiverOid: anObject [

	receiverOid := anObject
]

{ #category : #accessing }
OgMessagePS >> selector [

	^ selector
]

{ #category : #accessing }
OgMessagePS >> selector: anObject [

	selector := anObject
]

{ #category : #accessing }
OgMessagePS >> sender [

	^ sender
]

{ #category : #accessing }
OgMessagePS >> sender: anObject [

	sender := anObject
]

{ #category : #accessing }
OgMessagePS >> senderOid [

	^ senderOid
]

{ #category : #accessing }
OgMessagePS >> senderOid: anObject [

	senderOid := anObject
]
