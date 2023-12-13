Class {
	#name : #ScpMethodCallIndirection,
	#superclass : #ScpRBNodeIndirection,
	#category : #'Scopeo-Instrumentation'
}

{ #category : #'instance creation' }
ScpMethodCallIndirection >> for: aNode [

	aNode isMethod ifFalse: [ self error: 'Cannot install method call indirection on node: ', aNode asString ].
	super for: aNode
]

{ #category : #actions }
ScpMethodCallIndirection >> install [

	super install.
	self node body addNodeFirst: self indirectionNode.
]
