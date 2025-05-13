Class {
	#name : 'ScpWhichObjectsAreOfClass',
	#superclass : 'ScpFindingFocusPointQuestion',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'testing' }
ScpWhichObjectsAreOfClass class >> hasSubjectSelectionPresenter [

	^ true
]

{ #category : 'accessing' }
ScpWhichObjectsAreOfClass class >> label [

	^ 'Which objects are of class <a Class> ?'
]

{ #category : 'as yet unclassified' }
ScpWhichObjectsAreOfClass class >> subjectSelectionPresenter: aBlock [

   ^ ScpClassSubjectPresenter new
		whenSelectedDo: aBlock;
		yourself
]

{ #category : 'testing' }
ScpWhichObjectsAreOfClass >> isAssignmentMatching: aScpAssignmentTrace [

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
ScpWhichObjectsAreOfClass >> isMessageMatching: aScpMessageTrace [

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
ScpWhichObjectsAreOfClass >> isMethodMatching: aScpMethodTrace [

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
ScpWhichObjectsAreOfClass >> isSubjectValid [

	^ subject isNotNil and: [ subject isClass ]
]

{ #category : 'accessing' }
ScpWhichObjectsAreOfClass >> label [

	^ 'Objects which are of class "' , subject name , '" in scope: ' , scope label 
]
