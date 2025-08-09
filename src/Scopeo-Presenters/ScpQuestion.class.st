Class {
	#name : 'ScpQuestion',
	#superclass : 'ScpExecutionRecordVisitor',
	#instVars : [
		'scope',
		'subject',
		'references'
	],
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'testing' }
ScpQuestion class >> hasSubjectSelectionPresenter [

	^ false
]

{ #category : 'testing' }
ScpQuestion class >> isAbstract [

	^ self == ScpQuestion
]

{ #category : 'accessing' }
ScpQuestion class >> label [

 	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
ScpQuestion class >> subjectSelectionPresenter: aBlock [

   ^ SpPresenter new
		layout: (SpBoxLayout newVertical);
		yourself
]

{ #category : 'adding' }
ScpQuestion >> add: anObject reference: aTrace [

	references at: anObject 
		ifPresent: [ :refs | refs add: aTrace ] 
		ifAbsentPut: [ OrderedCollection newFrom: { aTrace } ]
]

{ #category : 'accessing' }
ScpQuestion >> answer [

	^ ScpExplorationScope new
		label: self label;
		record: (self visitExecutionRecord: scope record);
		references: references;
		yourself
		
]

{ #category : 'testing' }
ScpQuestion >> hasSubject [

	^ true
]

{ #category : 'initialization' }
ScpQuestion >> initialize [

	references := IdentityDictionary new
]

{ #category : 'testing' }
ScpQuestion >> isAssignmentMatching: aScpAssignmentTrace [

	^ false
]

{ #category : 'testing' }
ScpQuestion >> isMessageMatching: aScpMessageTrace [

	^ false
]

{ #category : 'testing' }
ScpQuestion >> isMethodMatching: aScpMethodTrace [

	^ false
]

{ #category : 'testing' }
ScpQuestion >> isSubjectValid [

	self subclassResponsibility
]

{ #category : 'accessing' }
ScpQuestion >> label [
	
	self subclassResponsibility
]

{ #category : 'accessing' }
ScpQuestion >> scope: aScpExplorationScope [

	scope := aScpExplorationScope
]

{ #category : 'accessing' }
ScpQuestion >> subject: aSubject [

	subject := aSubject
]

{ #category : 'visiting' }
ScpQuestion >> visitAssignmentTrace: aScpAssignmentTrace [

	(self isAssignmentMatching: aScpAssignmentTrace) ifFalse: [ ^ nil ].
	
	^ aScpAssignmentTrace copy
]

{ #category : 'visiting' }
ScpQuestion >> visitExecutionRecord: aScpExecutionRecord [
		
	| methods |
	
	methods := aScpExecutionRecord methods collect: [ :m | 
		self visitMethodTrace: m
	].
	methods := methods select: [ :m | m isNotNil ].

	^ ScpExecutionRecordTree new
		methods: methods;
		yourself
]

{ #category : 'visiting' }
ScpQuestion >> visitMessageTrace: aScpMessageTrace [

	| children |

	children := aScpMessageTrace children collect: [ :child | 
		child accept: self 
	].
	children := children select: [ :child | child isNotNil ].

	(children isNotEmpty or: [ self isMessageMatching: aScpMessageTrace] ) ifFalse: [ ^ nil ].
	
	children do: [ :child | child parent: aScpMessageTrace ].

	^ aScpMessageTrace copy
		children: children;
		yourself	
]

{ #category : 'visiting' }
ScpQuestion >> visitMethodTrace: aScpMethodTrace [

	| children |

	children := aScpMethodTrace children collect: [ :child | 
		child accept: self 
	].
	children := children select: [ :child | child isNotNil ].

	(children isNotEmpty or: [ self isMethodMatching: aScpMethodTrace] ) ifFalse: [ ^ nil ].
	
	children do: [ :child | child parent: aScpMethodTrace ].

	^ aScpMethodTrace copy
		children: children;
		yourself	
]
