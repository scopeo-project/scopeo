Class {
	#name : #ScpSteppingModel,
	#superclass : #Object,
	#instVars : [
		'debugger'
	],
	#category : #'Scopeo-UI-Model'
}

{ #category : #accessing }
ScpSteppingModel >> debugger [

	^ debugger
]

{ #category : #accessing }
ScpSteppingModel >> debugger: aDebugger [

	debugger := aDebugger
]

{ #category : #'debug - stepping' }
ScpSteppingModel >> stepToBytecodeIndex: aBytecodeIndex [

	self tracer timeTravelToBytecodeIndex: aBytecodeIndex
]

{ #category : #'debug - stepping' }
ScpSteppingModel >> stepToEnd [

	self tracer stepToEnd
]

{ #category : #'debug - stepping' }
ScpSteppingModel >> stepToNextStatement [
	
	self tracer perform advanceToNextStatement 
]

{ #category : #'debug - stepping' }
ScpSteppingModel >> stepToPrevStatement [
	
	self tracer perform reverseToPreviousStatement 
]

{ #category : #'debug - stepping' }
ScpSteppingModel >> stepToStart [

	self tracer timeTravelToUserStart
]

{ #category : #accessing }
ScpSteppingModel >> tracer [

	^ debugger debuggerActionModel tracer
]
