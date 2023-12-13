Class {
	#name : #ScpMethodCallIndirection,
	#superclass : #ScpASTIndirection,
	#category : #'Scopeo-Instrumentation'
}

{ #category : #'instance creation' }
ScpMethodCallIndirection >> for: aNode [

	aNode isInstanceVariable ifFalse: [ self error: 'Cannot install method call indirection on node: ', aNode ].
	super for: aNode
]

{ #category : #actions }
ScpMethodCallIndirection >> install [

	self node body addNodeFirst: self indirectionNode.
]
