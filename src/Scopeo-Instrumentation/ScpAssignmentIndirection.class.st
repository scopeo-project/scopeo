Class {
	#name : #ScpAssignmentIndirection,
	#superclass : #ScpASTIndirection,
	#category : #'Scopeo-Instrumentation'
}

{ #category : #services }
ScpAssignmentIndirection >> for: aNode [

	aNode isInstanceVariable ifFalse: [ self error: 'Cannot install assignment indirection on node: ', aNode ].
	super for: aNode parent
]
