Class {
	#name : 'ScpInterpreter',
	#superclass : 'DASTInterpreter',
	#category : 'Scopeo-Traces',
	#package : 'Scopeo-Traces'
}

{ #category : 'api' }
ScpInterpreter >> currentContext: aContext [

	currentContext := aContext
]

{ #category : 'accessing' }
ScpInterpreter >> programCounter: aCounter [

	programCounter := aCounter
]
