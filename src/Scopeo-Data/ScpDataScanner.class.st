Class {
	#name : #ScpDataScanner,
	#superclass : #ScpInterpreter,
	#instVars : [
		'defaultInterpreter',
		'rejectedPackages',
		'rejectedClasses',
		'storage',
		'withRecord',
		'alternateVisitor'
	],
	#classInstVars : [
		'logger'
	],
	#category : #'Scopeo-Data'
}

{ #category : #private }
ScpDataScanner >> alternateVisitorStartingAt: aRBNode [

	
	alternateVisitor := DASTInterpreter new.

	alternateVisitor currentContext: self currentContext copy.
	alternateVisitor currentContext evaluator:
		self currentContext evaluator copy.
	alternateVisitor currentContext evaluator interpreter: alternateVisitor.
	
	"self assert: currentContext evaluator interpreter == self."
	self assert: alternateVisitor currentContext evaluator interpreter == alternateVisitor.
	self assert: currentContext ~~ alternateVisitor currentContext.
	self assert: currentContext nodes == alternateVisitor currentContext nodes.
	^ alternateVisitor
]

{ #category : #accessing }
ScpDataScanner >> beWithoutRecording [

	withRecord := false.
]

{ #category : #initialization }
ScpDataScanner >> data: aScpData [

	storage := aScpData
]

{ #category : #initialization }
ScpDataScanner >> initialize [

	defaultInterpreter := ScpDefaultInterpreter new.
	
	rejectedPackages := OrderedCollection new.
	rejectedClasses := OrderedCollection new.
	
	withRecord := true.
]

{ #category : #'as yet unclassified' }
ScpDataScanner >> isRejected: anObject [

	| senderClass packageIsRejected classIsRejected |
	senderClass := anObject class.
	packageIsRejected := rejectedPackages includes:
		                     senderClass package name.
	classIsRejected := rejectedClasses includes: senderClass name.

	^ (senderClass ~~ UndefinedObject) and: [
		  packageIsRejected or: [ classIsRejected ] ]
]

{ #category : #parameters }
ScpDataScanner >> rejectClasses: aClassNameCollection [

	rejectedClasses := aClassNameCollection
]

{ #category : #parameters }
ScpDataScanner >> rejectPackages: aPackageNameCollection [

	rejectedPackages := aPackageNameCollection
]

{ #category : #services }
ScpDataScanner >> scan: aProgram [

	self evaluateAST: (RBParser parseExpression: aProgram).
]

{ #category : #private }
ScpDataScanner >> visitAssignmentNode: aRBAssignmentNode [

	| variable name value |
	variable := aRBAssignmentNode variable.
	name := variable name.
	value := self stackTop.
	
	(withRecord and: [ variable isInstanceVariable ])
	 ifTrue: [
		storage addStateUpdate:
			(ScpStateUpdate new
				 id: programCounter;
				 object: self currentContext receiver;
				 variable: variable variable;
				 newValue: value;
				 yourself) ].

	self currentContext assignVariable: name value: value
]

{ #category : #private }
ScpDataScanner >> visitMessageNode: aRBMessageNode [

	| arguments receiver method newContext | 
	"MyStack instance add: currentContext stack."
	(withRecord and: [ self isRejected: self currentContext receiver ])
		ifTrue: [		"self halt."
			self class logger add: self currentContext copy.
			aRBMessageNode acceptVisitor:
				  (self alternateVisitorStartingAt: aRBMessageNode). 
				currentContext := alternateVisitor currentContext.
				"self halt."
				currentContext evaluator interpreter: self.
				^self ].
			
	"self haltIf: [
		withRecord not or: [ aRBMessageNode selector = 'crTrace:' ] ]."

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

	withRecord ifTrue: [
		storage addMessage: (ScpMessage new
				 id: programCounter;
				 sender: self currentContext receiver;
				 senderSelector: (self currentContext messageNode ifNotNil: [
							  self currentContext messageNode selector ]);
				 selector: method selector;
				 receiver: receiver;
				 arguments: arguments;
				 yourself) ].

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

{ #category : #accessing }
ScpDataScanner >> withRecord [

	^ withRecord
]
