Class {
	#name : 'ScpAssignments',
	#superclass : 'ScpExecutionQuestion',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'accessing' }
ScpAssignments class >> label [

 	^ 'All assignments in <scope>'
]

{ #category : 'testing' }
ScpAssignments >> hasSubject [

	^ false
]

{ #category : 'testing' }
ScpAssignments >> isAssignmentMatching: anAssignmentTrace [

	self add: anAssignmentTrace object reference: anAssignmentTrace.
	self add: anAssignmentTrace oldValue reference: anAssignmentTrace.
	self add: anAssignmentTrace newValue reference: anAssignmentTrace.
	
	^ true 
]

{ #category : 'testing' }
ScpAssignments >> isSubjectValid [

	^ true
]

{ #category : 'accessing' }
ScpAssignments >> label [

	^ 'All assignments in scope:', scope label
]
