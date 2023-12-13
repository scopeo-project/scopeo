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

{ #category : #accessing }
ScpRBNodeIndirection >> arguments [

	^ arguments
]

{ #category : #parameters }
ScpRBNodeIndirection >> arguments: aArguments [

	arguments := aArguments
]

{ #category : #parameters }
ScpRBNodeIndirection >> beBeforeNodeExecution [

	symbol := #keyword:arguments:
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

	^ RBMessageNode
		  receiver: (RBMessageNode
				   receiver: (RBMessageNode
						    receiver:
						    (RBVariableNode named: #ScpInstrumentationRegistry)
						    selector: #instance)
				   selector: #at:
				   arguments: { (RBLiteralValueNode value: identifier) })
		  selector: symbol
		  arguments: { 
				  (RBBlockNode body: (RBSequenceNode statements: { self node })).
				  (RBArrayNode statements: arguments) 
		  }
]

{ #category : #initialization }
ScpRBNodeIndirection >> initialize [

	identifier := ScpInstrumentationRegistry instance size + 1.
]

{ #category : #services }
ScpRBNodeIndirection >> install [

	self register
]

{ #category : #services }
ScpRBNodeIndirection >> installAndCompile [

	self install.
	self node method recompileAST
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

{ #category : #'tools registry' }
ScpRBNodeIndirection >> unregister [

	ScpInstrumentationRegistry instance removeKey: identifier.
]
