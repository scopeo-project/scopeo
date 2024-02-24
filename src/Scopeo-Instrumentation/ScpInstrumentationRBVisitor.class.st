Class {
	#name : #ScpInstrumentationRBVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'indirectionIdentifier'
	],
	#category : #'Scopeo-Instrumentation'
}

{ #category : #testing }
ScpInstrumentationRBVisitor class >> isAbstract [

	^ self == RBProgramNodeVisitor
]

{ #category : #accessing }
ScpInstrumentationRBVisitor >> indirectionIdentifier [

	^ indirectionIdentifier
]

{ #category : #accessing }
ScpInstrumentationRBVisitor >> indirectionIdentifier: anIdentifier [

	indirectionIdentifier := anIdentifier
]

{ #category : #API }
ScpInstrumentationRBVisitor >> visit: aRBMessageNode [
	^ aRBMessageNode acceptVisitor: self
]

{ #category : #visiting }
ScpInstrumentationRBVisitor >> visitArrayNode: anArrayNode [

	^ anArrayNode statements:
		(anArrayNode children collect: [ :each | self visitNode: each ]);yourself
]

{ #category : #visiting }
ScpInstrumentationRBVisitor >> visitAssignmentNode: anAssignmentNode [

	anAssignmentNode
		variable: (self visitNode: anAssignmentNode variable);
		value: (self visitNode: anAssignmentNode value).
		
	anAssignmentNode variable isInstanceVariable ifFalse: [ ^ anAssignmentNode ].

	^ RBMessageNode
		  receiver: (RBMessageNode
				   receiver: (RBMessageNode
						    receiver:
						    (RBVariableNode named: #ScpInstrumentationRegistry)
						    selector: #instance)
				   selector: #at:
				   arguments:
				   { (RBLiteralValueNode value: self indirectionIdentifier) })
		  selector: #assignment:variable:of:value:
		  arguments: {
				  (RBBlockNode body:
					   (RBSequenceNode statements: { anAssignmentNode })).
				  (RBLiteralValueNode value: anAssignmentNode variable name).
				  (RBVariableNode named: #self).
				  anAssignmentNode value }
]

{ #category : #visiting }
ScpInstrumentationRBVisitor >> visitBlockNode: aBlockNode [

	^ aBlockNode arguments:( self visitArgumentNodes: aBlockNode arguments);
		body: (self visitNode: aBlockNode body);
		yourself
]

{ #category : #visiting }
ScpInstrumentationRBVisitor >> visitCascadeNode: aCascadeNode [

	| receiverNode receiverNodeVariable statements |
	receiverNode := aCascadeNode receiver.
	receiverNodeVariable := RBVariableNode named: #receiver.
	statements := OrderedCollection new.
	statements add:
		(RBAssignmentNode variable: receiverNodeVariable value: receiverNode).
	statements addAll: (aCascadeNode messages collect: [ :m |
			 m receiver: receiverNodeVariable ]).
	statements := statements collect: [ :s | s acceptVisitor: self ].

	^ RBMessageNode
		  receiver: (RBBlockNode body: (RBSequenceNode
					    temporaries: { receiverNodeVariable }
					    statements: statements))
		  selector: #value
]

{ #category : #visiting }
ScpInstrumentationRBVisitor >> visitEnglobingErrorNode: anEnglobingErrorNode [

	^ anEnglobingErrorNode contents:  ( anEnglobingErrorNode contents collect: [ :each | self visitNode: each ]); yourself
]

{ #category : #visiting }
ScpInstrumentationRBVisitor >> visitLiteralArrayNode: aRBLiteralArrayNode [

	^ aRBLiteralArrayNode contents: ( aRBLiteralArrayNode contents collect: [ :each | self visitNode: each ]);yourself
]

{ #category : #visiting }
ScpInstrumentationRBVisitor >> visitLiteralNode: aLiteralNode [

	^ aLiteralNode
]

{ #category : #visiting }
ScpInstrumentationRBVisitor >> visitMessageNode: aMessageNode [

	aMessageNode
			  receiver: (self visitNode: aMessageNode receiver);
			  selector: (self visitNode: aMessageNode selectorNode);
			  arguments: (aMessageNode arguments collect: [ :each | self visitNode: each ]).

	aMessageNode receiver isBlock ifTrue: [ ^ aMessageNode ].

	^ RBMessageNode
		  receiver: (RBMessageNode
				   receiver: (RBMessageNode
						    receiver:
						    (RBVariableNode named: #ScpInstrumentationRegistry)
						    selector: #instance)
				   selector: #at:
				   arguments:
				   { (RBLiteralValueNode value: self indirectionIdentifier) })
		  selector: #message:selector:to:with:
		  arguments: {
				  (RBBlockNode body: (RBSequenceNode statements: { aMessageNode })).
				  (RBLiteralValueNode value: aMessageNode selector).
				  aMessageNode receiver.
				  (RBArrayNode statements: aMessageNode arguments ) }
]

{ #category : #visiting }
ScpInstrumentationRBVisitor >> visitMethodNode: aMethodNode [

	aMethodNode arguments:
		(self visitArgumentNodes: aMethodNode arguments).
	aMethodNode pragmas:
		(aMethodNode pragmas collect: [ :each | self visitNode: each ]).
	aMethodNode body: (self visitNode: aMethodNode body).
	aMethodNode body addNodeFirst: (RBMessageNode
			 receiver: (RBMessageNode
					  receiver: (RBMessageNode
							   receiver:
							   (RBVariableNode named: #ScpInstrumentationRegistry)
							   selector: #instance)
					  selector: #at:
					  arguments:
					  { (RBLiteralValueNode value: self indirectionIdentifier) })
			 selector: #method:of:from:with:
			 arguments: {
					 (RBLiteralValueNode value: aMethodNode selector).
					 (RBVariableNode named: #self).
					 (RBMessageNode
						  receiver: (RBMessageNode
								   receiver: (RBVariableNode named: #thisContext)
								   selector: #sender)
						  selector: #receiver).
					 (RBArrayNode statements: aMethodNode arguments) }).
	^ aMethodNode
]

{ #category : #visiting }
ScpInstrumentationRBVisitor >> visitParseErrorNode: anErrorNode [

	^ anErrorNode
]

{ #category : #visiting }
ScpInstrumentationRBVisitor >> visitPatternBlockNode: aRBPatternBlockNode [

	^ aRBPatternBlockNode
		arguments: (self visitArgumentNodes: aRBPatternBlockNode arguments);
		body: (self visitNode: aRBPatternBlockNode body);
		yourself
]

{ #category : #visiting }
ScpInstrumentationRBVisitor >> visitPatternWrapperBlockNode: aRBPatternWrapperBlockNode [

	^ aRBPatternWrapperBlockNode wrappedNode: (

	self visitNode: aRBPatternWrapperBlockNode wrappedNode); arguments: (
	self visitArgumentNodes: aRBPatternWrapperBlockNode arguments); body: (
	self visitNode: aRBPatternWrapperBlockNode body);yourself
]

{ #category : #visiting }
ScpInstrumentationRBVisitor >> visitPragmaNode: aPragmaNode [

	^ aPragmaNode arguments: (aPragmaNode  arguments do: [ :each | self visitNode: each ]); yourself
]

{ #category : #visiting }
ScpInstrumentationRBVisitor >> visitReturnNode: aReturnNode [

	^ aReturnNode value: ( self visitNode: aReturnNode value); yourself
]

{ #category : #visiting }
ScpInstrumentationRBVisitor >> visitSelectorNode: aSelectorNode [

	^ aSelectorNode
]

{ #category : #visiting }
ScpInstrumentationRBVisitor >> visitSequenceNode: aSequenceNode [

	^ aSequenceNode temporaries: (
	self visitTemporaryNodes: aSequenceNode temporaries);statements: (
	aSequenceNode statements collect: [ :each | self visitNode: each ]);yourself
]
