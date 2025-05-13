Class {
	#name : 'ScpWhichPackagesAreInvolved',
	#superclass : 'ScpFindingFocusPointQuestion',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'accessing' }
ScpWhichPackagesAreInvolved class >> label [

	^ 'Which packages are involved in <a Scope> ?'
]

{ #category : 'testing' }
ScpWhichPackagesAreInvolved >> hasSubject [

	^ false
]

{ #category : 'testing' }
ScpWhichPackagesAreInvolved >> isAssignmentMatching: aScpAssignmentTrace [

	self add: aScpAssignmentTrace object class package reference: aScpAssignmentTrace .
	self add: aScpAssignmentTrace oldValue class package reference: aScpAssignmentTrace.
	self add: aScpAssignmentTrace newValue class package reference: aScpAssignmentTrace.
	
	^ true 
]

{ #category : 'testing' }
ScpWhichPackagesAreInvolved >> isMessageMatching: aScpMessageTrace [

	self add: aScpMessageTrace receiver class package reference: aScpMessageTrace .
	self add: aScpMessageTrace sender class package reference: aScpMessageTrace.
	aScpMessageTrace arguments do: [ :a |
		self add: a class package reference: aScpMessageTrace
	].

	^ true
]

{ #category : 'testing' }
ScpWhichPackagesAreInvolved >> isMethodMatching: aScpMethodTrace [

	self add: aScpMethodTrace receiver class package reference: aScpMethodTrace.
	self add: aScpMethodTrace sender class package reference: aScpMethodTrace.
	aScpMethodTrace arguments do: [ :a |
		self add: a class package reference: aScpMethodTrace
	].

	^ true
]

{ #category : 'testing' }
ScpWhichPackagesAreInvolved >> isSubjectValid [

	^ true
]

{ #category : 'accessing' }
ScpWhichPackagesAreInvolved >> label [

	^ 'Packages involved in the scope: ' , scope label 
]
