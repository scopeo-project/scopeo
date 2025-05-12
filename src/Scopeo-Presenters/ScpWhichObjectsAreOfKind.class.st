Class {
	#name : 'ScpWhichObjectsAreOfKind',
	#superclass : 'ScpQuestion',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'accessing' }
ScpWhichObjectsAreOfKind class >> label [

	^ 'Which objects are of kind <a Class> ?'
]

{ #category : 'as yet unclassified' }
ScpWhichObjectsAreOfKind class >> subjectSelectionPresenter: aBlock [

   ^ ScpWhichObjectsAreOfKindSubjectPresenter new
		whenSelectedDo: aBlock;
		yourself
]

{ #category : 'testing' }
ScpWhichObjectsAreOfKind >> isAssignmentMatching: aScpAssignmentTrace [

	| matching |

	matching := false.

	(aScpAssignmentTrace object isKindOf: subject) ifTrue: [ 
		self add: aScpAssignmentTrace object reference: aScpAssignmentTrace .
	].

	(aScpAssignmentTrace oldValue isKindOf: subject) ifTrue: [ 
		self add: aScpAssignmentTrace oldValue reference: aScpAssignmentTrace.
	].

	(aScpAssignmentTrace newValue isKindOf: subject) ifTrue: [ 
		self add: aScpAssignmentTrace newValue reference: aScpAssignmentTrace.
	].

	^ matching 
]

{ #category : 'testing' }
ScpWhichObjectsAreOfKind >> isMessageMatching: aScpMessageTrace [

	| matching |

	matching := false.

	(aScpMessageTrace receiver isKindOf: subject) ifTrue: [ 
		self add: aScpMessageTrace receiver reference: aScpMessageTrace .
	].

	(aScpMessageTrace sender isKindOf: subject) ifTrue: [ 
		self add: aScpMessageTrace sender reference: aScpMessageTrace.
	].

	(aScpMessageTrace arguments select: [ :a | a isKindOf: subject ]) do: [ :a |
		self add: a reference: aScpMessageTrace
	].

	^ matching 
]

{ #category : 'testing' }
ScpWhichObjectsAreOfKind >> isMethodMatching: aScpMethodTrace [

	| matching |

	matching := false.

	(aScpMethodTrace receiver isKindOf: subject) ifTrue: [ 
		self add: aScpMethodTrace receiver reference: aScpMethodTrace.
	].

	(aScpMethodTrace sender isKindOf: subject) ifTrue: [ 
		self add: aScpMethodTrace sender reference: aScpMethodTrace.
	].

	(aScpMethodTrace arguments select: [ :a | a isKindOf: subject ]) do: [ :a |
		self add: a reference: aScpMethodTrace
	].

	^ matching 
]

{ #category : 'testing' }
ScpWhichObjectsAreOfKind >> isSubjectValid [

	^ subject isNotNil and: [ subject isClass ]
]

{ #category : 'accessing' }
ScpWhichObjectsAreOfKind >> label [

	^ 'Objects which are of class "' , subject name , '" in scope: ' , scope label 
]
