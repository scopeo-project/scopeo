Class {
	#name : #ScopeoSteppingModel,
	#superclass : #Object,
	#instVars : [
		'debugger'
	],
	#category : #'Scopeo-GUI'
}

{ #category : #accessing }
ScopeoSteppingModel >> debugger [

	^ debugger
]

{ #category : #accessing }
ScopeoSteppingModel >> debugger: aDebugger [

	debugger := aDebugger
]

{ #category : #'debug - stepping' }
ScopeoSteppingModel >> stepToBytecodeIndex: aBytecodeIndex [

	self tracer timeTravelToBytecodeIndex: aBytecodeIndex
]

{ #category : #'debug - stepping' }
ScopeoSteppingModel >> stepToEnd [

	self tracer stepToEnd
]

{ #category : #'debug - stepping' }
ScopeoSteppingModel >> stepToNextStatement [
	
	self tracer perform advanceToNextStatement 
]

{ #category : #'debug - stepping' }
ScopeoSteppingModel >> stepToPrevStatement [
	
	self tracer perform reverseToPreviousStatement 
]

{ #category : #'debug - stepping' }
ScopeoSteppingModel >> stepToStart [

	self tracer timeTravelToUserStart
]

{ #category : #accessing }
ScopeoSteppingModel >> tracer [

	^ debugger debuggerActionModel tracer
]
