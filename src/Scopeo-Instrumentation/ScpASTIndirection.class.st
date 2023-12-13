Class {
	#name : #ScpASTIndirection,
	#superclass : #Object,
	#instVars : [
		'handler',
		'nodes',
		'identifier',
		'arguments',
		'selector',
		'before',
		'instead',
		'after',
		'indirectionSelector',
		'afterSelector',
		'beforeSelector',
		'insteadSelector',
		'node',
		'indirectionNode',
		'indirection',
		'symbol'
	],
	#category : #'Scopeo-Instrumentation'
}

{ #category : #parameters }
ScpASTIndirection >> after [

	symbol := 'after'
]

{ #category : #private }
ScpASTIndirection >> after: aStatementBlock arguments: aArguments [
	
	| result |
	result := aStatementBlock value.
	handler perform: afterSelector withArguments: aArguments.
	^ result
]

{ #category : #accessing }
ScpASTIndirection >> arguments [

	^ arguments
]

{ #category : #parameters }
ScpASTIndirection >> arguments: aArguments [

	arguments := aArguments
]

{ #category : #parameters }
ScpASTIndirection >> before [

	symbol := 'before'
]

{ #category : #private }
ScpASTIndirection >> before: aStatementBlock arguments: aArguments [
	
	handler perform: selector withArguments: aArguments.
	^ aStatementBlock value.
	
]

{ #category : #services }
ScpASTIndirection >> for: aNode [

	node := aNode
	
]

{ #category : #accessing }
ScpASTIndirection >> handler [

	^ handler
]

{ #category : #parameters }
ScpASTIndirection >> handler: aHandler [

	handler := aHandler
]

{ #category : #private }
ScpASTIndirection >> indirectionNode [

	^ RBParser parseExpression: (
		'(ScpInstrumentationRegistry instance at: {1}) {2}: [{3}] arguments: {4}' 
		format: { identifier . symbol . self node sourceCode . arguments }
	).
	
]

{ #category : #initialization }
ScpASTIndirection >> initialize [

	nodes := IdentitySet new.
	identifier := ScpInstrumentationRegistry instance size + 1
]

{ #category : #services }
ScpASTIndirection >> install [

	self node parent 
		replaceNode: self node 
		withNode: self indirectionNode
]

{ #category : #services }
ScpASTIndirection >> installAndCompile [

	self install.
	self node method recompileAST
]

{ #category : #parameters }
ScpASTIndirection >> instead [

	symbol := 'instead'
]

{ #category : #private }
ScpASTIndirection >> instead: aStatementBlock arguments: aArguments [

	^ handler perform: insteadSelector withArguments: aArguments
]

{ #category : #accessing }
ScpASTIndirection >> node [

	^ node
]

{ #category : #accessing }
ScpASTIndirection >> nodes [

	^ nodes
]
