Class {
	#name : 'ScpWhichObjectsInteractWithAnObject',
	#superclass : 'ScpBuildingOnFocusPointQuestion',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'accessing' }
ScpWhichObjectsInteractWithAnObject class >> label [

	^ 'Which objects interact with <an Object> ?'
]

{ #category : 'as yet unclassified' }
ScpWhichObjectsInteractWithAnObject class >> subjectSelectionPresenter: aBlock [

   ^ ScpStringSubjectPresenter new
		whenSelectedDo: aBlock;
		yourself
]

{ #category : 'testing' }
ScpWhichObjectsInteractWithAnObject >> isAssignmentMatching: aScpAssignmentTrace [

	| matching |

	matching := false.

	(aScpAssignmentTrace object == subject) ifTrue: [ 
		self add: aScpAssignmentTrace object reference: aScpAssignmentTrace.
		matching := true.
	].

	(aScpAssignmentTrace oldValue == subject) ifTrue: [ 
		self add: aScpAssignmentTrace oldValue reference: aScpAssignmentTrace.
		matching := true.
	].

	(aScpAssignmentTrace newValue == subject) ifTrue: [ 
		self add: aScpAssignmentTrace newValue reference: aScpAssignmentTrace.
		matching := true.
	].

	^ matching 
]

{ #category : 'testing' }
ScpWhichObjectsInteractWithAnObject >> isMessageMatching: aScpMessageTrace [

	| matching |

	matching := false.

	(aScpMessageTrace receiver == subject) ifTrue: [ 
		self add: aScpMessageTrace receiver reference: aScpMessageTrace.
		matching := true.
	].

	(aScpMessageTrace sender == subject) ifTrue: [ 
		self add: aScpMessageTrace sender reference: aScpMessageTrace.
		matching := true.
	].

	(aScpMessageTrace arguments select: [ :a | a == subject ]) do: [ :a |
		self add: a reference: aScpMessageTrace.
		matching := true.
	].

	^ matching 
]

{ #category : 'testing' }
ScpWhichObjectsInteractWithAnObject >> isMethodMatching: aScpMethodTrace [

	| matching |

	matching := false.

	(aScpMethodTrace receiver == subject) ifTrue: [ 
		self add: aScpMethodTrace receiver reference: aScpMethodTrace.
		matching := true.
	].

	(aScpMethodTrace sender == subject) ifTrue: [ 
		self add: aScpMethodTrace sender reference: aScpMethodTrace.
		matching := true.
	].

	(aScpMethodTrace arguments select: [ :a | a == subject ]) do: [ :a |
		self add: a reference: aScpMethodTrace.
		matching := true.
	].

	^ matching 
]

{ #category : 'testing' }
ScpWhichObjectsInteractWithAnObject >> isSubjectValid [

	^ true
]

{ #category : 'accessing' }
ScpWhichObjectsInteractWithAnObject >> label [

	^ 'Which objects interact with "' , subject asString , '" in scope: ', scope label
]
