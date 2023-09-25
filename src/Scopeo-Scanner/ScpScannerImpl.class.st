Class {
	#name : #ScpScannerImpl,
	#superclass : #DASTInterpreter,
	#traits : 'MolComponentImpl + ScpScanner + ScpScannerServices',
	#classTraits : 'MolComponentImpl classTrait + ScpScanner classTrait + ScpScannerServices classTrait',
	#category : #'Scopeo-Scanner'
}

{ #category : #'component accessing' }
ScpScannerImpl >> getScpScannerDataEventsNotifier [
	^self eventsNotifiers at: ScpScannerDataEvents ifAbsent: [^MolNotFoundEventsNotifier new interface: ScpScannerDataEvents name: nil].
]

{ #category : #scanning }
ScpScannerImpl >> scan: aProgram [

	self evaluateAST: (RBParser parseExpression: aProgram)
]

{ #category : #visiting }
ScpScannerImpl >> visitAssignmentNode: aRBAssignmentNode [

	| variable name value |
	variable := aRBAssignmentNode variable.
	name := variable name.
	value := self stackTop.

	variable isInstanceVariable ifTrue: [
				self getScpScannerDataEventsNotifier instanceVariableAssigned:
					(ScpScannedAssignment new
						 object: self currentContext receiver;
						 variable: variable variable;
						 newValue: value;
						 yourself) ] .

	self currentContext assignVariable: name value: value
]

{ #category : #visiting }
ScpScannerImpl >> visitMessageNode: aRBMessageNode [

	| arguments receiver method newContext sender |
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

	sender := self currentContext receiver.
			self getScpScannerDataEventsNotifier messageSent:
				(ScpScannedMessage new
					 selector: method selector;
					 sender: self currentContext receiver;
					 senderSelector: (self currentContext messageNode ifNotNil: [
								  self currentContext messageNode selector ]);
					 selector: aRBMessageNode selector value;
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
