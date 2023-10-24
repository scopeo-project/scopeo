Class {
	#name : 'ScpDataScanner',
	#superclass : 'ScpInterpreter',
	#instVars : [
		'defaultInterpreter',
		'rejectedPackages',
		'rejectedClasses',
		'storage'
	],
	#category : 'Scopeo-Data',
	#package : 'Scopeo-Data'
}

{ #category : 'initialization' }
ScpDataScanner >> data: aScpData [

	storage := aScpData
]

{ #category : 'initialization' }
ScpDataScanner >> initialize [

	defaultInterpreter := ScpDefaultInterpreter new.
	
	rejectedPackages := OrderedCollection new.
	rejectedClasses := OrderedCollection new.
]

{ #category : 'parameters' }
ScpDataScanner >> rejectClasses: aClassNameCollection [

	rejectedClasses := aClassNameCollection
]

{ #category : 'parameters' }
ScpDataScanner >> rejectPackages: aPackageNameCollection [

	rejectedPackages := aPackageNameCollection
]

{ #category : 'services' }
ScpDataScanner >> scan: aProgram [

	self evaluateAST: (RBParser parseExpression: aProgram).
]

{ #category : 'private' }
ScpDataScanner >> visitAndRecordMessageNode: aRBMessageNode [

	| arguments receiver method newContext |
	" Resolve Arguments ""self haltIf: [ aRBMessageNode selector = #methodDict ]."
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
ScpDataScanner >> visitAssignmentNode: aRBAssignmentNode [

	| variable name value |
	variable := aRBAssignmentNode variable.
	name := variable name.
	value := self stackTop.

	variable isInstanceVariable ifTrue: [
		storage addStateUpdate:
			(ScpStateUpdate new
				 id: programCounter;
				 object: self currentContext receiver;
				 variable: variable variable;
				 newValue: value;
				 yourself) ].

	self currentContext assignVariable: name value: value
]

{ #category : 'private' }
ScpDataScanner >> visitMessageNode: aRBMessageNode [

	"| senderClass packageIsRejected classIsRejected |
	
	senderClass := self currentContext receiver class.
	packageIsRejected := rejectedPackages includes: senderClass package name.
	classIsRejected := rejectedClasses includes: senderClass name.

	(senderClass ~~ UndefinedObject and:
		 (packageIsRejected or: [ classIsRejected ]))
		ifTrue: [
			currentContext := defaultInterpreter
				initializeWithProgram: aRBMessageNode inContext: currentContext;
				evaluate; currentContext ]
		ifFalse: [  ]."
	self visitAndRecordMessageNode: aRBMessageNode
]
