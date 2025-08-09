Class {
	#name : 'ScpObjectsOfKind',
	#superclass : 'ScpExecutionQuestion',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'testing' }
ScpObjectsOfKind class >> hasSubjectSelectionPresenter [

	^ true
]

{ #category : 'accessing' }
ScpObjectsOfKind class >> label [

	^ 'All objects of kind <a Class>, in <scope>'
]

{ #category : 'as yet unclassified' }
ScpObjectsOfKind class >> subjectSelectionPresenter: aBlock [

   ^ ScpClassSubjectPresenter new
		whenSelectedDo: aBlock;
		yourself
]

{ #category : 'testing' }
ScpObjectsOfKind >> isAssignmentMatching: aScpAssignmentTrace [

	| matching |

	matching := false.

	(aScpAssignmentTrace object isKindOf: subject) ifTrue: [ 
		self add: aScpAssignmentTrace object reference: aScpAssignmentTrace.
		matching := true.
	].

	(aScpAssignmentTrace oldValue isKindOf: subject) ifTrue: [ 
		self add: aScpAssignmentTrace oldValue reference: aScpAssignmentTrace.
		matching := true.
	].

	(aScpAssignmentTrace newValue isKindOf: subject) ifTrue: [ 
		self add: aScpAssignmentTrace newValue reference: aScpAssignmentTrace.
		matching := true.
	].

	^ matching 
]

{ #category : 'testing' }
ScpObjectsOfKind >> isMessageMatching: aScpMessageTrace [

	| matching |

	matching := false.

	(aScpMessageTrace receiver isKindOf: subject) ifTrue: [ 
		self add: aScpMessageTrace receiver reference: aScpMessageTrace.
		matching := true.
	].

	(aScpMessageTrace sender isKindOf: subject) ifTrue: [ 
		self add: aScpMessageTrace sender reference: aScpMessageTrace.
		matching := true.
	].

	(aScpMessageTrace arguments select: [ :a | a isKindOf: subject ]) do: [ :a |
		self add: a reference: aScpMessageTrace.
		matching := true.
	].

	^ matching 
]

{ #category : 'testing' }
ScpObjectsOfKind >> isMethodMatching: aScpMethodTrace [

	| matching |

	matching := false.

	(aScpMethodTrace receiver isKindOf: subject) ifTrue: [ 
		self add: aScpMethodTrace receiver reference: aScpMethodTrace.
		matching := true.
	].

	(aScpMethodTrace sender isKindOf: subject) ifTrue: [ 
		self add: aScpMethodTrace sender reference: aScpMethodTrace.
		matching := true.
	].

	(aScpMethodTrace arguments select: [ :a | a isKindOf: subject ]) do: [ :a |
		self add: a reference: aScpMethodTrace.
		matching := true.
	].

	^ matching 
]

{ #category : 'testing' }
ScpObjectsOfKind >> isSubjectValid [

	^ subject isNotNil and: [ subject isClass ]
]

{ #category : 'accessing' }
ScpObjectsOfKind >> label [

	^ 'Objects which are of class "' , subject name , '" in scope: ' , scope label 
]
