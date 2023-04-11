Class {
	#name : #OgProgramState,
	#superclass : #Object,
	#instVars : [
		'seekerProgramState',
		'bytecodeIndex',
		'pc'
	],
	#category : #'Scopeo-Model-ProgramState'
}

{ #category : #'instance creation' }
OgProgramState class >> fromSeekerPS: aProgramState [

	aProgramState nodeIsAssignmentOfInstanceVariable ifTrue: [ 
		^ OgAssignmentPS fromSeekerPS: aProgramState ].
	aProgramState isMessageSend ifTrue: [ 
		^ OgMessagePS fromSeekerPS: aProgramState ].

	^ OGUnsupportedPS new
]

{ #category : #testing }
OgProgramState class >> isAbstract [

	^ self == OgProgramState
]

{ #category : #accessing }
OgProgramState >> bytecodeIndex [

	^ bytecodeIndex
]

{ #category : #accessing }
OgProgramState >> bytecodeIndex: aBytecodeIndex [

	bytecodeIndex := aBytecodeIndex
]

{ #category : #testing }
OgProgramState >> isAssignment [

	^ false
]

{ #category : #testing }
OgProgramState >> isMessage [

	^ false
]

{ #category : #testing }
OgProgramState >> isSupported [

	^ true
]

{ #category : #accessing }
OgProgramState >> pc [

	^ pc
]

{ #category : #accessing }
OgProgramState >> pc: aProgramCounter [

	pc := aProgramCounter
]

{ #category : #accessing }
OgProgramState >> seekerProgramState [

	^ seekerProgramState
]

{ #category : #accessing }
OgProgramState >> seekerProgramState: anObject [

	seekerProgramState := anObject
]
