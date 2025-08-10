Class {
	#name : 'ScpEventIntersectionsWithObject',
	#superclass : 'ScpObjectCentricQuestion',
	#instVars : [
		'events'
	],
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'accessing' }
ScpEventIntersectionsWithObject class >> label [

	^ 'Intersection of the events refering to <an Object> and events from scope: <scope>'
]

{ #category : 'visiting' }
ScpEventIntersectionsWithObject >> answer [

	events := ScpEventWithObject new
		subject: subject;
		scope: (scope parent ifNil: [ scope ] ifNotNil: [ :parent | parent ]);
		answer.
		
	^ ScpExplorationScope new
		label: self label;
		record: (self visitExecutionRecord: events record and: scope record);
		references: references;
		yourself
		
]

{ #category : 'testing' }
ScpEventIntersectionsWithObject >> isAssignmentMatching: aScpAssignmentTrace [

	self add: aScpAssignmentTrace object reference: aScpAssignmentTrace.
	self add: aScpAssignmentTrace oldValue reference: aScpAssignmentTrace.
	self add: aScpAssignmentTrace newValue reference: aScpAssignmentTrace.
	
	^ true
]

{ #category : 'testing' }
ScpEventIntersectionsWithObject >> isMessageMatching: aScpMessageTrace [

	self add: aScpMessageTrace receiver reference: aScpMessageTrace.
	self add: aScpMessageTrace sender reference: aScpMessageTrace.
		(aScpMessageTrace arguments) do: [ :a |
			self add: a reference: aScpMessageTrace.
	].

	^ true
]

{ #category : 'testing' }
ScpEventIntersectionsWithObject >> isMethodMatching: aScpMethodTrace [

	self add: aScpMethodTrace receiver reference: aScpMethodTrace.
	self add: aScpMethodTrace sender reference: aScpMethodTrace.
		(aScpMethodTrace arguments) do: [ :a |
			self add: a reference: aScpMethodTrace.
		].
	
	^ true 
]

{ #category : 'testing' }
ScpEventIntersectionsWithObject >> isSubjectValid [

	^ true
]

{ #category : 'accessing' }
ScpEventIntersectionsWithObject >> label [
	
	^ 'Intersection of the events refering to "', subject asString , '-' , subject hash asString , '" and events from scope: ', scope label
]

{ #category : 'visiting' }
ScpEventIntersectionsWithObject >> visitAssigmentTrace: leftAssignment and: rightAssignment [

	leftAssignment = rightAssignment ifFalse: [ ^ nil ].
	
	self isAssignmentMatching: leftAssignment.
	
	^ leftAssignment copy
]

{ #category : 'visiting' }
ScpEventIntersectionsWithObject >> visitExecutionRecord: aLeftExecution and: aRightExecution [

	| methods |

	methods := aLeftExecution methods collect: [ :lM | 
		aRightExecution methods 
			detect: [ :rM | rM = lM ] 
			ifFound: [:rM | self visitMethodTrace: lM and: rM ] ifNone: [ nil ].
	].

	methods := methods select: [ :m | m isNotNil ].

	^ ScpExecutionRecordTree new
		methods: methods;
		traceQuantity: (references values flatCollect: [ :v | v ] as: Set) size;
		yourself
]

{ #category : 'visiting' }
ScpEventIntersectionsWithObject >> visitMessageTrace: leftMessage and: rightMessage [

	| children |
	
	children := leftMessage children collect: [ :leftChild | 
		rightMessage children 
			detect: [ :rightChild | rightChild = leftChild ] 
			ifFound: [:rightChild | leftChild accept: self and: rightChild ] ifNone: [ nil ].
	].	
		
	children := children select: [ :child | child isNotNil ].

	(leftMessage = rightMessage or: [ children isNotEmpty ]) ifFalse: [ ^ nil ].
	
	self isMessageMatching: leftMessage.
	
	children do: [ :child | child parent: leftMessage ].

	^ leftMessage copy
		children: children;
		yourself	
]

{ #category : 'visiting' }
ScpEventIntersectionsWithObject >> visitMethodTrace: leftMethod and: rightMethod [

	| children |
	
	children := leftMethod children collect: [ :leftChild | 
		rightMethod children 
			detect: [ :rightChild | rightChild = leftChild ] 
			ifFound: [:rightChild | leftChild accept: self and: rightChild ] ifNone: [ nil ].
	].	
		
	children := children select: [ :child | child isNotNil ].
	
	(leftMethod = rightMethod or: [ children isNotEmpty ]) ifFalse: [ ^ nil ].
	
	self isMethodMatching: leftMethod.
	
	children do: [ :child | child parent: rightMethod ].

	^ leftMethod copy
		children: children;
		yourself	
]
