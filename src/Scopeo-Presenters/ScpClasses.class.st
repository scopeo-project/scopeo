Class {
	#name : 'ScpClasses',
	#superclass : 'ScpSourceQuestion',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'accessing' }
ScpClasses class >> label [

	^ 'All classes involved in <scope> ?'
]

{ #category : 'as yet unclassified' }
ScpClasses >> hasSubject [

	^ false
]

{ #category : 'testing' }
ScpClasses >> isAssignmentMatching: aScpAssignmentTrace [

	self add: aScpAssignmentTrace object class reference: aScpAssignmentTrace .
	self add: aScpAssignmentTrace oldValue class reference: aScpAssignmentTrace.
	self add: aScpAssignmentTrace newValue class reference: aScpAssignmentTrace.
	
	^ true 
]

{ #category : 'testing' }
ScpClasses >> isMessageMatching: aScpMessageTrace [

	self add: aScpMessageTrace receiver class reference: aScpMessageTrace .
	self add: aScpMessageTrace sender class reference: aScpMessageTrace.
	aScpMessageTrace arguments do: [ :a |
		self add: a class reference: aScpMessageTrace
	].

	^ true
]

{ #category : 'testing' }
ScpClasses >> isMethodMatching: aScpMethodTrace [

	self add: aScpMethodTrace receiver class reference: aScpMethodTrace.
	self add: aScpMethodTrace sender class reference: aScpMethodTrace.
	aScpMethodTrace arguments do: [ :a |
		self add: a class reference: aScpMethodTrace
	].

	^ true
]

{ #category : 'testing' }
ScpClasses >> isSubjectValid [

	^ true
]

{ #category : 'accessing' }
ScpClasses >> label [

	^ 'Classes involved in the scope: ' , scope label 
]
