Class {
	#name : 'ScpMessagesSentByObject',
	#superclass : 'ScpObjectCentricQuestion',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'accessing' }
ScpMessagesSentByObject class >> label [

	^ 'All messages sent by <an Object>, in <scope>'
]

{ #category : 'as yet unclassified' }
ScpMessagesSentByObject class >> subjectSelectionPresenter: aBlock [

   ^ ScpStringSubjectPresenter new
		whenSelectedDo: aBlock;
		yourself
]

{ #category : 'testing' }
ScpMessagesSentByObject >> isMessageMatching: aScpMessageTrace [

	| matching |

	matching := false.

	(aScpMessageTrace sender == subject) ifTrue: [ 
		self add: aScpMessageTrace sender reference: aScpMessageTrace.
		matching := true.
	].

	^ matching 
]

{ #category : 'testing' }
ScpMessagesSentByObject >> isSubjectValid [

	^ true
]

{ #category : 'accessing' }
ScpMessagesSentByObject >> label [

	^ 'All messages sent by "' , subject asString , '-' , subject hash asString , '" in scope: ', scope label
]
