Class {
	#name : 'ScpEventWithObject',
	#superclass : 'ScpObjectCentricQuestion',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'accessing' }
ScpEventWithObject class >> label [

	^ 'All events involving <an Object>, in <scope>'
]

{ #category : 'testing' }
ScpEventWithObject >> isAssignmentMatching: aScpAssignmentTrace [

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
ScpEventWithObject >> isMessageMatching: aScpMessageTrace [

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
ScpEventWithObject >> isMethodMatching: aScpMethodTrace [

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
ScpEventWithObject >> isSubjectValid [

	^ true


]

{ #category : 'accessing' }
ScpEventWithObject >> label [
	
	^ 'Any event refering to "', subject asString, '", in scope: ', scope label
]
