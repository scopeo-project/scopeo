Class {
	#name : 'ScpAssignmentsOfObject',
	#superclass : 'ScpObjectCentricQuestion',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'accessing' }
ScpAssignmentsOfObject class >> label [

	^ 'All assignments of <an Object> to a variable, in <scope>'
]

{ #category : 'testing' }
ScpAssignmentsOfObject >> isAssignmentMatching: aScpAssignmentTrace [

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
ScpAssignmentsOfObject >> isSubjectValid [

	^ true
]

{ #category : 'accessing' }
ScpAssignmentsOfObject >> label [
	
	^ 'All assignments with, "', subject asString , '-' , subject hash asString , '" as new value, in scope: ', scope label
]
