Class {
	#name : 'ScpTracingInterpreter',
	#superclass : 'ScpInterpreter',
	#instVars : [
		'defaultInterpreter',
		'rejectedPackages',
		'rejectedClasses',
		'storage'
	],
	#classInstVars : [
		'logger'
	],
	#category : 'Scopeo-Traces',
	#package : 'Scopeo-Traces'
}

{ #category : 'initialization' }
ScpTracingInterpreter >> initialize [

	defaultInterpreter := ScpDefaultInterpreter new.

	rejectedPackages := OrderedCollection new.
	rejectedClasses := OrderedCollection new.
]

{ #category : 'as yet unclassified' }
ScpTracingInterpreter >> isRejected: anObject [

	| senderClass packageIsRejected classIsRejected |
	senderClass := anObject class.
	packageIsRejected := rejectedPackages includes:
		                     senderClass package name.
	classIsRejected := rejectedClasses includes: senderClass name.

	^ (senderClass ~~ UndefinedObject) and: [
		  packageIsRejected or: [ classIsRejected ] ]
]

{ #category : 'parameters' }
ScpTracingInterpreter >> rejectClasses: aClassNameCollection [

	rejectedClasses := aClassNameCollection
]

{ #category : 'parameters' }
ScpTracingInterpreter >> rejectPackages: aPackageNameCollection [

	rejectedPackages := aPackageNameCollection
]

{ #category : 'services' }
ScpTracingInterpreter >> traceExpressionString: anExpresssionString [

	^ self evaluateAST: (RBParser parseExpression: anExpresssionString)
]

{ #category : 'initialization' }
ScpTracingInterpreter >> traceStorage: aScpTraceStorage [

	storage := aScpTraceStorage
]

{ #category : 'private' }
ScpTracingInterpreter >> visitAssignmentNode: aRBAssignmentNode [

	| variable name value |
	variable := aRBAssignmentNode variable.
	name := variable name.
	value := self stackTop.

	variable isInstanceVariable ifTrue: [
		storage addStateUpdate: (ScpStateUpdate new
				 id: programCounter;
				 object: self currentContext receiver;
				 variable: variable variable;
				 newValue: value;
				 yourself) ].

	self currentContext assignVariable: name value: value
]

{ #category : 'private' }
ScpTracingInterpreter >> visitMessageNode: aRBMessageNode [

	| arguments receiver method newContext |
	(self isRejected: self currentContext receiver)
		ifTrue: [ ^ self visitMessageNodeWithoutTracing: aRBMessageNode ].

	arguments := (self stackPop: aRBMessageNode numArgs) reverse.
	(aRBMessageNode isCascaded and: [ aRBMessageNode isFirstCascaded not ])
		ifTrue: [ self stackPop ].
	receiver := self stackPop.

	" Current context initialization (implicit lookup)"
	newContext := DASTContext
		              newWithSender: self currentContext
		              receiver: receiver
		              messageNode: aRBMessageNode
		              evaluator: self evaluator.

	" Lookup"
	method := newContext methodOrBlock.

	storage addMessage: (ScpMessage new
			 id: programCounter;
			 sender: self currentContext receiver;
			 senderSelector: (self currentContext messageNode ifNotNil: [
						  self currentContext messageNode selector ]);
			 selector: method selector;
			 receiver: receiver;
			 arguments: arguments;
			 yourself).

	" Apply - invoke method "
	(aRBMessageNode isCascaded and: [
		 aRBMessageNode parent messages last ~= aRBMessageNode ]) ifTrue: [
		self stackPush: receiver ].
	(method isPrimitive and: [
		 method isMessageValue not and: [ method isOnDo not ] ]) ifTrue: [
		[
		^ self
			  solvePrimitive: method
			  receiver: receiver
			  arguments: arguments ]
			on: DASTPrimitiveFailed
			do: [ " Remove pragma node from method body to prevent infinit loop 
			  and continue with the excecution of the method body"
				newContext := newContext
					              removePrimitiveFromMethod;
					              yourself ] ].
	" Set new context "
	currentContext := newContext.
	currentContext
		setTemporalVariablesNamed: method argumentNames
		values: arguments
]

{ #category : 'private' }
ScpTracingInterpreter >> visitMessageNodeWithoutTracing: aRBMessageNode [

	defaultInterpreter currentContext: self currentContext.
	self currentContext evaluator interpreter: defaultInterpreter.
	
	defaultInterpreter visitMessageNode: aRBMessageNode.
				
	self currentContext: defaultInterpreter currentContext.
	self currentContext evaluator interpreter: self.
	
]
