Class {
	#name : 'ScpWhichClassesAreInvolved',
	#superclass : 'ScpFindingFocusPointQuestion',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'accessing' }
ScpWhichClassesAreInvolved class >> label [

	^ 'Which classes are involved in <a Scope> ?'
]

{ #category : 'as yet unclassified' }
ScpWhichClassesAreInvolved >> hasSubject [

	^ false
]

{ #category : 'testing' }
ScpWhichClassesAreInvolved >> isAssignmentMatching: aScpAssignmentTrace [

	self add: aScpAssignmentTrace object class reference: aScpAssignmentTrace .
	self add: aScpAssignmentTrace oldValue class reference: aScpAssignmentTrace.
	self add: aScpAssignmentTrace newValue class reference: aScpAssignmentTrace.
	
	^ true 
]

{ #category : 'testing' }
ScpWhichClassesAreInvolved >> isMessageMatching: aScpMessageTrace [

	self add: aScpMessageTrace receiver class reference: aScpMessageTrace .
	self add: aScpMessageTrace sender class reference: aScpMessageTrace.
	aScpMessageTrace arguments do: [ :a |
		self add: a class reference: aScpMessageTrace
	].

	^ true
]

{ #category : 'testing' }
ScpWhichClassesAreInvolved >> isMethodMatching: aScpMethodTrace [

	self add: aScpMethodTrace receiver class reference: aScpMethodTrace.
	self add: aScpMethodTrace sender class reference: aScpMethodTrace.
	aScpMethodTrace arguments do: [ :a |
		self add: a class reference: aScpMethodTrace
	].

	^ true
]

{ #category : 'testing' }
ScpWhichClassesAreInvolved >> isSubjectValid [

	^ true
]

{ #category : 'accessing' }
ScpWhichClassesAreInvolved >> label [

	^ 'Classes involved in the scope: ' , scope label 
]
