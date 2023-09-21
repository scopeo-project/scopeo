Class {
	#name : #ScpInterpreter,
	#superclass : #DASTInterpreter,
	#category : #'Scopeo-Interpreter'
}

{ #category : #hooks }
ScpInterpreter >> onMessage: aMethod to: aReceiver from: aSender with: anArguments [
	
	"[  (aSender asString , ' ', aMethod selector asString, ' ', aReceiver asString , ' ', anArguments asString) crTrace ] on: Error do: [ 'error' crTrace ]."
]

{ #category : #'as yet unclassified' }
ScpInterpreter >> onUpdateOf: anObject variable: anInstanceVariable value: aValue [

	[ (anObject asString , ' ' , anInstanceVariable asString, ' ', aValue asString ) crTrace] on: Error do: [ 'error' crTrace ]
]

{ #category : #visiting }
ScpInterpreter >> visitAssignmentNode: aRBAssignmentNode [ 
	| variable name value |
	variable := aRBAssignmentNode variable.
	name := variable name.
	value := self stackTop.
	
	variable isInstanceVariable ifTrue: [
		self onUpdateOf: self currentContext receiver variable: variable variable value: value.
	].
	
	self currentContext assignVariable: name value: value
]

{ #category : #visiting }
ScpInterpreter >> visitMessageNode: aRBMessageNode [

	| arguments receiver method newContext |
	" Resolve Arguments "

	"self haltIf: [ aRBMessageNode selector = #methodDict ]."
	arguments := (self stackPop: aRBMessageNode numArgs) reverse.	
	(aRBMessageNode isCascaded and: [aRBMessageNode isFirstCascaded not]) ifTrue: [ self stackPop ].
	receiver := self stackPop.


	
	
	" Current context initialization (implicit lookup)"
	newContext := 
		DASTContext
			newWithSender: self currentContext 
			receiver: receiver 
			messageNode: aRBMessageNode
			evaluator: self evaluator.
	
	" Lookup"
	method := newContext methodOrBlock.
	
	self onMessage: method to: receiver from: self currentContext with: arguments.
	
	" Apply - invoke method "
	(aRBMessageNode isCascaded and: [aRBMessageNode parent messages last ~= aRBMessageNode]) ifTrue: [ self stackPush: receiver ]. 
	(method isPrimitive and: [method isMessageValue not and: [method isOnDo not]] )  
	ifTrue: [ 
		[ ^ self solvePrimitive: method receiver: receiver arguments: arguments ]
		on: DASTPrimitiveFailed 
		do: [ 
			" Remove pragma node from method body to prevent infinit loop 
			  and continue with the excecution of the method body"
			  newContext := newContext removePrimitiveFromMethod;yourself.
			]
		].
	" Set new context "
	currentContext := newContext.
	currentContext setTemporalVariablesNamed: method argumentNames values: arguments.
]
