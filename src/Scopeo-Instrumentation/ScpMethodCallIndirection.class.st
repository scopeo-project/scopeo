Class {
	#name : #ScpMethodCallIndirection,
	#superclass : #ScpRBNodeIndirection,
	#category : #'Scopeo-Instrumentation'
}

{ #category : #'instance creation' }
ScpMethodCallIndirection >> for: aNode [

	aNode isInstanceVariable ifFalse: [ self error: 'Cannot install method call indirection on node: ', aNode ].
	super for: aNode
]

{ #category : #actions }
ScpMethodCallIndirection >> install [

	self register.
	self node body addNodeFirst: self indirectionNode.
]
