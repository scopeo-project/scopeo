Class {
	#name : #Trace,
	#superclass : #Object,
	#instVars : [
		'seekerProgramState',
		'bytecodeIndex',
		'pc'
	],
	#category : #'Scopeo-Trace'
}

{ #category : #'instance creation' }
Trace class >> fromSeekerPS: aProgramState [

	aProgramState nodeIsAssignmentOfInstanceVariable ifTrue: [ 
		^ AssignmentTrace fromSeekerPS: aProgramState ].
	aProgramState isMessageSend ifTrue: [ 
		^ MessageTrace fromSeekerPS: aProgramState ].

	^ UnsupportedTrace new
]

{ #category : #testing }
Trace class >> isAbstract [

	^ self == Trace
]

{ #category : #accessing }
Trace >> bytecodeIndex [

	^ bytecodeIndex
]

{ #category : #accessing }
Trace >> bytecodeIndex: aBytecodeIndex [

	bytecodeIndex := aBytecodeIndex
]

{ #category : #testing }
Trace >> isAssignment [

	^ false
]

{ #category : #testing }
Trace >> isMessage [

	^ false
]

{ #category : #testing }
Trace >> isSupported [

	^ true
]

{ #category : #accessing }
Trace >> pc [

	^ pc
]

{ #category : #accessing }
Trace >> pc: aProgramCounter [

	pc := aProgramCounter
]

{ #category : #accessing }
Trace >> seekerProgramState [

	^ seekerProgramState
]

{ #category : #accessing }
Trace >> seekerProgramState: anObject [

	seekerProgramState := anObject
]
