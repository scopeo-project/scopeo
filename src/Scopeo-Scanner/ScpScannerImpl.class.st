Class {
	#name : #ScpScannerImpl,
	#superclass : #DASTInterpreter,
	#traits : 'MolComponentImpl + ScpScanner + ScpScannerParameters + ScpScannerServices',
	#classTraits : 'MolComponentImpl classTrait + ScpScanner classTrait + ScpScannerParameters classTrait + ScpScannerServices classTrait',
	#instVars : [
		'ignoredPackages'
	],
	#category : #'Scopeo-Scanner-Implementation'
}

{ #category : #'component accessing' }
ScpScannerImpl >> getScpScannerDataEventsNotifier [
	^self eventsNotifiers at: ScpScannerDataEvents ifAbsent: [^MolNotFoundEventsNotifier new interface: ScpScannerDataEvents name: nil].
]

{ #category : #'component accessing' }
ScpScannerImpl >> getScpScannerDataEventsSubscribers [

	^ self eventsSubscribers at: ScpScannerDataEvents ifAbsent: [
		  ^ MolNotFoundEventsNotifier new
			    interface: ScpScannerDataEvents
			    name: nil ]
]

{ #category : #parameters }
ScpScannerImpl >> ignoredPackages: aCollection [

	ignoredPackages := aCollection
]

{ #category : #events }
ScpScannerImpl >> instanceVariableAssigned: anScpScannedAssigment [
	"A new value has been assigned to an object instance variable."
	
	self getScpScannerDataEventsNotifier instanceVariableAssigned: anScpScannedAssigment
]

{ #category : #events }
ScpScannerImpl >> messageSent: aMessage [
	"A message has been sent by an object during the execution of the program."

	self getScpScannerDataEventsNotifier messageSent: aMessage
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
		self getScpScannerDataEventsNotifier instanceVariableAssigned: (ScpScannedAssignment new
				 object: self currentContext receiver;
				 variable: variable variable;
				 newValue: value;
				 yourself) ].

	self currentContext assignVariable: name value: value
]

{ #category : #visiting }
ScpScannerImpl >> visitMessageNode: aRBMessageNode [

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

	self getScpScannerDataEventsNotifier messageSent: (ScpScannedMessage new
			 selector: method selector;
			 sender: self currentContext;
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
