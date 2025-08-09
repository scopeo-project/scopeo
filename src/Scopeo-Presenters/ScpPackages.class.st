Class {
	#name : 'ScpPackages',
	#superclass : 'ScpSourceQuestion',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'accessing' }
ScpPackages class >> label [

	^ 'All packages involved in <scope> ?'
]

{ #category : 'testing' }
ScpPackages >> hasSubject [

	^ false
]

{ #category : 'testing' }
ScpPackages >> isAssignmentMatching: aScpAssignmentTrace [

	self add: aScpAssignmentTrace object class package reference: aScpAssignmentTrace .
	self add: aScpAssignmentTrace oldValue class package reference: aScpAssignmentTrace.
	self add: aScpAssignmentTrace newValue class package reference: aScpAssignmentTrace.
	
	^ true 
]

{ #category : 'testing' }
ScpPackages >> isMessageMatching: aScpMessageTrace [

	self add: aScpMessageTrace receiver class package reference: aScpMessageTrace .
	self add: aScpMessageTrace sender class package reference: aScpMessageTrace.
	aScpMessageTrace arguments do: [ :a |
		self add: a class package reference: aScpMessageTrace
	].

	^ true
]

{ #category : 'testing' }
ScpPackages >> isMethodMatching: aScpMethodTrace [

	self add: aScpMethodTrace receiver class package reference: aScpMethodTrace.
	self add: aScpMethodTrace sender class package reference: aScpMethodTrace.
	aScpMethodTrace arguments do: [ :a |
		self add: a class package reference: aScpMethodTrace
	].

	^ true
]

{ #category : 'testing' }
ScpPackages >> isSubjectValid [

	^ true
]

{ #category : 'accessing' }
ScpPackages >> label [

	^ 'Packages involved in the scope: ' , scope label 
]
