Class {
	#name : 'ScpExplorationScopeBuilder',
	#superclass : 'ScpExecutionRecordVisitor',
	#instVars : [
		'references'
	],
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'building' }
ScpExplorationScopeBuilder class >> buildFrom: aScpExecutionRecord [

	^ self new buildFrom: aScpExecutionRecord
]

{ #category : 'adding' }
ScpExplorationScopeBuilder >> add: anObject reference: aTrace [

	anObject isLiteral ifTrue: [ ^ self ].

	references at: anObject 
		ifPresent: [ :refs | refs add: aTrace ] 
		ifAbsentPut: [ OrderedCollection newFrom: { aTrace } ]
]

{ #category : 'building' }
ScpExplorationScopeBuilder >> buildFrom: aScpExecutionRecord [

	references := Dictionary new.

	"self visitExecutionRecord: aScpExecutionRecord."

	^ ScpExplorationScope new
		record: aScpExecutionRecord;
		references: references;
		yourself
]

{ #category : 'visiting' }
ScpExplorationScopeBuilder >> visitAssignmentTrace: aScpAssignmentTrace [

	self add: aScpAssignmentTrace object reference: aScpAssignmentTrace.
	self add: aScpAssignmentTrace newValue reference: aScpAssignmentTrace.
	
	super visitAssignmentTrace: aScpAssignmentTrace
]

{ #category : 'visiting' }
ScpExplorationScopeBuilder >> visitMessageTrace: aScpMessageTrace [

	self add: aScpMessageTrace receiver reference: aScpMessageTrace.
	self add: aScpMessageTrace sender reference: aScpMessageTrace.
	aScpMessageTrace arguments do: [ :argument |
		self add: argument reference: aScpMessageTrace. 		
	].

	super visitMessageTrace: aScpMessageTrace

]

{ #category : 'visiting' }
ScpExplorationScopeBuilder >> visitMethodTrace: aScpMethodTrace [


	aScpMethodTrace receiver asString.
	aScpMethodTrace sender asString.

	self add: aScpMethodTrace receiver reference: aScpMethodTrace.
	self add: aScpMethodTrace sender reference: aScpMethodTrace.

	aScpMethodTrace arguments do: [ :argument |
				argument asString.

		self add: argument reference: aScpMethodTrace
	].

	self add: aScpMethodTrace result reference: aScpMethodTrace.

	super visitMethodTrace: aScpMethodTrace
]
