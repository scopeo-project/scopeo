Class {
	#name : #ScpAssignmentIndirection,
	#superclass : #ScpASTIndirection,
	#category : #'Scopeo-Instrumentation'
}

{ #category : #accessing }
ScpAssignmentIndirection >> indirectionNode: aNode [

	^ RBParser parseExpression: (
		'(ScpInstrumentationRegistry instance at: {1}) onAssignment: {2} of: self value: {3}' 
		format: {identifier . aNode name . aNode parent value}
	  ).
	
]

{ #category : #displaying }
ScpAssignmentIndirection >> installOn: aNode [

	super installOn: aNode.
	aNode ast instanceVariableWriteNodes do: [ :node |
		| assignment |
		assignment := node parent.
		assignment parent
			replaceNode: assignment
			withNode: (self indirectionNode: aNode)
	]
]

{ #category : #testing }
ScpAssignmentIndirection >> isCompatibleWith: aNode [

	^ aNode isAssignment
]

{ #category : #accessing }
ScpAssignmentIndirection >> name [

	^ 'Assignment indirection'
]

{ #category : #'events handling' }
ScpAssignmentIndirection >> onAssignment: aVariable of: anObject value: aValue [

	handler onAssignment: aVariable of: anObject value: aValue.
	anObject writeSlotNamed: aVariable value: aValue.
]
