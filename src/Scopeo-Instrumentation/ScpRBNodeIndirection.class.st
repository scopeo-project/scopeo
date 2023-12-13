Class {
	#name : #ScpRBNodeIndirection,
	#superclass : #Object,
	#instVars : [
		'handler',
		'identifier',
		'arguments',
		'node',
		'symbol',
		'selector'
	],
	#category : #'Scopeo-Instrumentation'
}

{ #category : #private }
ScpRBNodeIndirection >> after: aStatementBlock arguments: aArguments [
	
	| result |
	result := aStatementBlock value.
	handler perform: selector withArguments: aArguments.
	^ result
]

{ #category : #accessing }
ScpRBNodeIndirection >> arguments [

	^ arguments
]

{ #category : #parameters }
ScpRBNodeIndirection >> arguments: aArguments [

	arguments := '{' , ((aArguments collect: [ :a | a sourceCode ]) joinUsing: ' . ') , '}'
]

{ #category : #parameters }
ScpRBNodeIndirection >> beAfterNodeExecution [

	symbol := 'before'
]

{ #category : #parameters }
ScpRBNodeIndirection >> beBeforeNodeExecution [

	symbol := 'before'
]

{ #category : #parameters }
ScpRBNodeIndirection >> beInsteadOfNodeExecution [

	symbol := 'before'
]

{ #category : #private }
ScpRBNodeIndirection >> before: aStatementBlock arguments: aArguments [
	
	handler perform: selector withArguments: aArguments.
	^ aStatementBlock value.
	
]

{ #category : #services }
ScpRBNodeIndirection >> for: aNode [

	node := aNode
	
]

{ #category : #accessing }
ScpRBNodeIndirection >> handler [

	^ handler
]

{ #category : #parameters }
ScpRBNodeIndirection >> handler: aHandler [

	handler := aHandler
]

{ #category : #private }
ScpRBNodeIndirection >> indirectionNode [

	^ RBParser parseExpression: (
		'(ScpInstrumentationRegistry instance at: {1}) {2}: [{3}] arguments: {4}' 
		format: { identifier . symbol . self node sourceCode . arguments }
	)
	
]

{ #category : #initialization }
ScpRBNodeIndirection >> initialize [

	identifier := ScpInstrumentationRegistry instance size + 1.
]

{ #category : #services }
ScpRBNodeIndirection >> install [

	self register.
	self installedOn: self node
]

{ #category : #services }
ScpRBNodeIndirection >> installAndCompile [

	self install.
	self node method recompileAST
]

{ #category : #private }
ScpRBNodeIndirection >> instead: aStatementBlock arguments: aArguments [

	^ handler perform: selector withArguments: aArguments
]

{ #category : #accessing }
ScpRBNodeIndirection >> node [

	^ node
]

{ #category : #'tools registry' }
ScpRBNodeIndirection >> register [

	ScpInstrumentationRegistry instance 
		at: identifier 
		ifAbsentPut: [ self ]
]

{ #category : #parameters }
ScpRBNodeIndirection >> selector: aHandlerSelector [

	selector := aHandlerSelector
]

{ #category : #services }
ScpRBNodeIndirection >> uninstall [

	self unregister
]

{ #category : #'tools registry' }
ScpRBNodeIndirection >> unregister [

	ScpInstrumentationRegistry instance removeKey: identifier.
]
