Class {
	#name : 'ScpMessagesReceivedByObject',
	#superclass : 'ScpObjectCentricQuestion',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'accessing' }
ScpMessagesReceivedByObject class >> label [

	^ 'All messages received by <an Object>, in <scope>'
]

{ #category : 'as yet unclassified' }
ScpMessagesReceivedByObject class >> subjectSelectionPresenter: aBlock [

   ^ ScpStringSubjectPresenter new
		whenSelectedDo: aBlock;
		yourself
]

{ #category : 'testing' }
ScpMessagesReceivedByObject >> isMessageMatching: aScpMessageTrace [

	| matching |

	matching := false.

	(aScpMessageTrace receiver == subject) ifTrue: [ 
		self add: aScpMessageTrace receiver reference: aScpMessageTrace.
		matching := true.
	].

	^ matching 
]

{ #category : 'testing' }
ScpMessagesReceivedByObject >> isSubjectValid [

	^ true
]

{ #category : 'accessing' }
ScpMessagesReceivedByObject >> label [

	^ 'All messages received by "' , subject asString , '-' , subject hash asString , '" in scope: ', scope label
]
