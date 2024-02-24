Class {
	#name : #ScpTraceSourceSelectionRegistry,
	#superclass : #Object,
	#instVars : [
		'announcer',
		'selections'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Scopeo-TraceRecorder-Model'
}

{ #category : #accessing }
ScpTraceSourceSelectionRegistry class >> instance [

	^ instance ifNil: [ instance := self new ]
]

{ #category : #event }
ScpTraceSourceSelectionRegistry >> announceUpdate [

	self announcer announce: ScpTraceSourceSelectionRegistryEvent 
]

{ #category : #accessing }
ScpTraceSourceSelectionRegistry >> announcer [

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #adding }
ScpTraceSourceSelectionRegistry >> at: aName [

	^ selections at: aName ifAbsent: [ nil ]
]

{ #category : #adding }
ScpTraceSourceSelectionRegistry >> at: aName put: aSelection [

	selections at: aName ifPresent: [
		self error:
			'A trace source selection named ' , aName , ' already exists.' ].

	selections at: aName put: aSelection.
	self announceUpdate
]

{ #category : #initialization }
ScpTraceSourceSelectionRegistry >> initialize [

	selections := Dictionary new
]

{ #category : #adding }
ScpTraceSourceSelectionRegistry >> remove: aName [

	selections removeKey: aName ifAbsent: [ ^ self ].
	self announceUpdate
]

{ #category : #accessing }
ScpTraceSourceSelectionRegistry >> selections [

	^ selections
]
