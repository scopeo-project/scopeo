Class {
	#name : #ScpAssignmentIndirection,
	#superclass : #ScpInstrumentationIndirection,
	#category : #'Scopeo-Instrumentation'
}

{ #category : #private }
ScpAssignmentIndirection >> assignment: anAssignmentBlock variable: aVariable of: anObject value: aValue [

	handler onAssignment: aVariable of: anObject value: aValue.
	anAssignmentBlock value
]

{ #category : #private }
ScpAssignmentIndirection >> indirectionNode: aNode [

	^ RBParser parseExpression: (
		'(ScpInstrumentationRegistry instance at: {1}) assignment: [{2}] variable: #{3} of: self value: {4}'
		format: { 
			self hash 
			. aNode sourceCode 
			. aNode variable name 
			. aNode value sourceCode 
		}
	)
]

{ #category : #services }
ScpAssignmentIndirection >> installOn: aNode [

	aNode isAssignment ifFalse: [ 
		self error: 'Cannot install assignment indirection on node: ', aNode asString
	].
	super installOn: aNode
]
