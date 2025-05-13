Class {
	#name : 'ScpWhichObjectsAreNamed',
	#superclass : 'ScpFindingFocusPointQuestion',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'testing' }
ScpWhichObjectsAreNamed class >> hasSubjectSelectionPresenter [

	^ true
]

{ #category : 'accessing' }
ScpWhichObjectsAreNamed class >> label [

	^ 'What are the objects whose names contain <a String> ?'
]

{ #category : 'as yet unclassified' }
ScpWhichObjectsAreNamed class >> subjectSelectionPresenter: aBlock [

   ^ ScpStringSubjectPresenter new
		whenSelectedDo: aBlock;
		yourself
]

{ #category : 'testing' }
ScpWhichObjectsAreNamed >> isAssignmentMatching: aScpAssignmentTrace [

	| matching |

	matching := false.

	(aScpAssignmentTrace object isCompiledBlock not and: [ aScpAssignmentTrace object asString includesSubstring: subject ]) ifTrue: [ 
		self add: aScpAssignmentTrace object reference: aScpAssignmentTrace.
		matching := true.
	].

	(aScpAssignmentTrace oldValue isCompiledBlock not and: [ aScpAssignmentTrace oldValue asString includesSubstring: subject ]) ifTrue: [ 
		self add: aScpAssignmentTrace oldValue reference: aScpAssignmentTrace.
		matching := true.
	].

	(aScpAssignmentTrace newValue isCompiledBlock not and: [ aScpAssignmentTrace newValue asString includesSubstring: subject ]) ifTrue: [ 
		self add: aScpAssignmentTrace newValue reference: aScpAssignmentTrace.
		matching := true.
	].

	^ matching 
]

{ #category : 'testing' }
ScpWhichObjectsAreNamed >> isMessageMatching: aScpMessageTrace [

	| matching |

	matching := false.

	(aScpMessageTrace receiver isCompiledBlock not and: [ aScpMessageTrace receiver asString includesSubstring: subject ]) ifTrue: [ 
		self add: aScpMessageTrace receiver reference: aScpMessageTrace.
		matching := true.
	].

	(aScpMessageTrace sender isCompiledBlock not and: [ aScpMessageTrace sender asString includesSubstring: subject ]) ifTrue: [ 
		self add: aScpMessageTrace sender reference: aScpMessageTrace.
		matching := true.
	].

	(aScpMessageTrace arguments select: [ :a | a isCompiledBlock not and: [ a asString includesSubstring: subject ]]) do: [ :a |
		self add: a reference: aScpMessageTrace.
		matching := true.
	].

	^ matching 
]

{ #category : 'testing' }
ScpWhichObjectsAreNamed >> isMethodMatching: aScpMethodTrace [

	| matching |

	matching := false.

	(aScpMethodTrace receiver isCompiledBlock not and: [ aScpMethodTrace receiver asString includesSubstring: subject ]) ifTrue: [ 
		self add: aScpMethodTrace receiver reference: aScpMethodTrace.
		matching := true.
	].

	(aScpMethodTrace sender isCompiledBlock not and: [ aScpMethodTrace sender asString includesSubstring: subject ]) ifTrue: [ 
		self add: aScpMethodTrace sender reference: aScpMethodTrace.
		matching := true.
	].

	(aScpMethodTrace arguments select: [ :a | a isCompiledBlock not and: [ a asString includesSubstring: subject ]]) do: [ :a |
		self add: a reference: aScpMethodTrace.
		matching := true.
	].

	^ matching
]

{ #category : 'testing' }
ScpWhichObjectsAreNamed >> isSubjectValid [

	^ true
]

{ #category : 'accessing' }
ScpWhichObjectsAreNamed >> label [

	^ 'Objects whose names contain "' , subject , '"'
]
