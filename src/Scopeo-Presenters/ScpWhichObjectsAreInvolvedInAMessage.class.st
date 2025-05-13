Class {
	#name : 'ScpWhichObjectsAreInvolvedInAMessage',
	#superclass : 'ScpBuildingOnFocusPointQuestion',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'testing' }
ScpWhichObjectsAreInvolvedInAMessage class >> hasSubjectSelectionPresenter [

	^ true
]

{ #category : 'accessing' }
ScpWhichObjectsAreInvolvedInAMessage class >> label [

	^ 'Which objects are involved in a message which selector is <a String> ?'
]

{ #category : 'as yet unclassified' }
ScpWhichObjectsAreInvolvedInAMessage class >> subjectSelectionPresenter: aBlock [

   ^ ScpStringSubjectPresenter new
		whenSelectedDo: aBlock;
		yourself
]

{ #category : 'testing' }
ScpWhichObjectsAreInvolvedInAMessage >> isAssignmentMatching: aScpAssignmentTrace [

	^ false 
]

{ #category : 'testing' }
ScpWhichObjectsAreInvolvedInAMessage >> isMessageMatching: aScpMessageTrace [

	(aScpMessageTrace node selector == subject asSymbol) ifFalse: [ ^ false ]. 
	
	self add: aScpMessageTrace receiver reference: aScpMessageTrace.
	self add: aScpMessageTrace sender reference: aScpMessageTrace.
	
	aScpMessageTrace arguments do: [ :a |
		self add: a reference: aScpMessageTrace.
	].

	^ true 
]

{ #category : 'testing' }
ScpWhichObjectsAreInvolvedInAMessage >> isMethodMatching: aScpMethodTrace [

	^ false
]

{ #category : 'testing' }
ScpWhichObjectsAreInvolvedInAMessage >> isSubjectValid [

	^ true
]

{ #category : 'accessing' }
ScpWhichObjectsAreInvolvedInAMessage >> label [

	^ 'Which objects are involved in a message which selector is "' , subject , '" in scope: ', scope label
]
