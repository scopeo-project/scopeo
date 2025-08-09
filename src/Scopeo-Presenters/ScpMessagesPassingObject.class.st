Class {
	#name : 'ScpMessagesPassingObject',
	#superclass : 'ScpObjectCentricQuestion',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'accessing' }
ScpMessagesPassingObject class >> label [

	^ 'All messages passing <an Object> in argument, in <scope>'
]

{ #category : 'as yet unclassified' }
ScpMessagesPassingObject >> isMessageMatching: aScpMessageTrace [

	| matching |

	matching := false.

	(aScpMessageTrace arguments select: [ :a | a == subject ]) do: [ :a |
		self add: a reference: aScpMessageTrace.
		matching := true.
	].

	^ matching 
]

{ #category : 'testing' }
ScpMessagesPassingObject >> isSubjectValid [

	^ true
]

{ #category : 'accessing' }
ScpMessagesPassingObject >> label [
	
	^ 'All messages passing "', subject asString, '" as argument, in scope: ', scope label
]
