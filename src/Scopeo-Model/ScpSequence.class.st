Class {
	#name : 'ScpSequence',
	#superclass : 'ScpExpression',
	#instVars : [
		'temporaries',
		'statements',
		'keywordVariables'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'uml' }
ScpSequence class >> uml: aStream [

	super uml: aStream.
	aStream cr << self name << ' o- "*" ' << ScpVariable name.
	aStream cr << self name << ' o- "*" ' << ScpExpression name
]

{ #category : 'visiting' }
ScpSequence >> accept: aVisitor [

	^ aVisitor visitSequence: self
]

{ #category : 'initialization' }
ScpSequence >> initialize [

	keywordVariables := Dictionary new.
	keywordVariables at: #self put: ScpVariable selfVariable.
	keywordVariables at: #super put: ScpVariable selfVariable.
	keywordVariables at: #thisContext put: ScpVariable selfVariable.
	
	
]

{ #category : 'initialization' }
ScpSequence >> keywordVariableAt: aVariableName [

	^ keywordVariables at: aVariableName	ifAbsent: [ ^ nil ]
	
]

{ #category : 'as yet unclassified' }
ScpSequence >> keywordVariables [

	^ keywordVariables values
]

{ #category : 'accessing' }
ScpSequence >> statements [

	^ statements
]

{ #category : 'accessing' }
ScpSequence >> statements: anExpressionCollection [

	statements := anExpressionCollection asOrderedCollection.
	statements do: [ :s | s parent: self ]
]

{ #category : 'accessing' }
ScpSequence >> temporaries [

	^ temporaries values
]

{ #category : 'accessing' }
ScpSequence >> temporaries: aVariableCollection [

	temporaries := Dictionary new.
	
	aVariableCollection asOrderedCollection do: [ :v |
		temporaries at: v name asSymbol ifAbsentPut: [ v ]	
	]
]

{ #category : 'accessing' }
ScpSequence >> temporaryNamed: aStringOrSymbol [

	^ temporaries at: aStringOrSymbol asSymbol ifAbsent: [ ^ nil ]
]
