Class {
	#name : #ScpRBNodeIndirection,
	#superclass : #Object,
	#instVars : [
		'handler',
		'identifier',
		'arguments',
		'node',
		'symbol',
		'selector',
		'installedNodes'
	],
	#category : #'Scopeo-Instrumentation'
}

{ #category : #parameters }
ScpRBNodeIndirection >> after [

	symbol := 'after'
]

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

	arguments := aArguments
]

{ #category : #parameters }
ScpRBNodeIndirection >> before [

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
	).
	
]

{ #category : #initialization }
ScpRBNodeIndirection >> initialize [

	identifier := ScpInstrumentationRegistry instance size + 1.
	installedNodes := OrderedCollection new
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

{ #category : #'as yet unclassified' }
ScpRBNodeIndirection >> installedOn: aNode [

	installedNodes add: aNode
]

{ #category : #parameters }
ScpRBNodeIndirection >> instead [

	symbol := 'instead'
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
