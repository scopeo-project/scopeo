Class {
	#name : 'ScpMethods',
	#superclass : 'ScpExecutionQuestion',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'accessing' }
ScpMethods class >> label [

	^ 'All messages in <scope>'
]

{ #category : 'accessing' }
ScpMethods >> hasSubject [

	^ false
]

{ #category : 'as yet unclassified' }
ScpMethods >> isMethodMatching: aMethodTrace [

	self add: aMethodTrace sender reference: aMethodTrace.
	self add: aMethodTrace receiver reference: aMethodTrace.
	
	aMethodTrace arguments do: [ :a |
		self add: a reference: aMethodTrace.		
	].
	
	^ true
]

{ #category : 'testing' }
ScpMethods >> isSubjectValid [

	^ true
]

{ #category : 'accessing' }
ScpMethods >> label [

	^ 'All methods executed in scope: ', scope label
]
