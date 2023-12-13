Class {
	#name : #ScpAssignmentIndirection,
	#superclass : #ScpRBValueNodeIndirection,
	#category : #'Scopeo-Instrumentation'
}

{ #category : #services }
ScpAssignmentIndirection >> for: aNode [

	aNode isAssignment ifFalse: [ self error: 'Cannot install assignment indirection on node: ', aNode ].
	super for: aNode
]
