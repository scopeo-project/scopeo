Class {
	#name : 'ScpAssignmentsToObjectState',
	#superclass : 'ScpObjectCentricQuestion',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'accessing' }
ScpAssignmentsToObjectState class >> label [

	^ 'All state modifications of <an Object>, in <scope>'
]

{ #category : 'testing' }
ScpAssignmentsToObjectState >> isAssignmentMatching: aScpAssignmentTrace [

	| matching |

	matching := false.

	(aScpAssignmentTrace object == subject) ifTrue: [ 
		self add: aScpAssignmentTrace object reference: aScpAssignmentTrace.
		matching := true.
	].

	^ matching 
]

{ #category : 'testing' }
ScpAssignmentsToObjectState >> isSubjectValid [

	^ true
]

{ #category : 'accessing' }
ScpAssignmentsToObjectState >> label [
	
	^ 'All state modifications of the object "', subject asString , '-' , subject hash asString , '", in scope: ', scope label
]
