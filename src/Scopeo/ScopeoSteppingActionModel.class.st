Class {
	#name : #ScopeoSteppingActionModel,
	#superclass : #Object,
	#instVars : [
		'debugger'
	],
	#category : #'Scopeo-GUI'
}

{ #category : #accessing }
ScopeoSteppingActionModel >> debugger: aDebugger [

	debugger := aDebugger
]

{ #category : #'debug - stepping' }
ScopeoSteppingActionModel >> stepToBytecodeIndex: aBytecodeIndex [

	self tracer timeTravelToBytecodeIndex: aBytecodeIndex
]

{ #category : #'debug - stepping' }
ScopeoSteppingActionModel >> stepToEnd [

	self tracer stepToEnd
]

{ #category : #'debug - stepping' }
ScopeoSteppingActionModel >> stepToNextStatement [
	
	self tracer perform advanceToNextStatement 
]

{ #category : #'debug - stepping' }
ScopeoSteppingActionModel >> stepToPrevStatement [
	
	self tracer perform reverseToPreviousStatement 
]

{ #category : #'debug - stepping' }
ScopeoSteppingActionModel >> stepToStart [

	self tracer timeTravelToUserStart
]

{ #category : #accessing }
ScopeoSteppingActionModel >> tracer [

	^ debugger debuggerActionModel tracer
]
