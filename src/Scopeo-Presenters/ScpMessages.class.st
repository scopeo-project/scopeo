Class {
	#name : 'ScpMessages',
	#superclass : 'ScpExecutionQuestion',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'accessing' }
ScpMessages class >> label [

	^ 'All messages in <scope>'
]

{ #category : 'accessing' }
ScpMessages >> hasSubject [

	^ false
]

{ #category : 'as yet unclassified' }
ScpMessages >> isMessageMatching: aMessageTrace [

	self add: aMessageTrace sender reference: aMessageTrace.
	self add: aMessageTrace receiver reference: aMessageTrace.
	
	aMessageTrace arguments do: [ :a |
		self add: a reference: aMessageTrace.		
	].
	
	^ true
]

{ #category : 'testing' }
ScpMessages >> isSubjectValid [

	^ true
]

{ #category : 'accessing' }
ScpMessages >> label [

	^ 'All messages in scope: ', scope label
]
