Class {
	#name : #ScpSequence,
	#superclass : #ScpExpression,
	#instVars : [
		'temporaries',
		'statements'
	],
	#category : #'Scopeo-Model'
}

{ #category : #visiting }
ScpSequence >> accept: aVisitor [

	^ aVisitor visitSequence: self
]

{ #category : #adding }
ScpSequence >> addStatement: anExpression [

	statements add: anExpression
]

{ #category : #adding }
ScpSequence >> addStatements: anExpressionCollection [

	statements addAll: anExpressionCollection
]

{ #category : #initialization }
ScpSequence >> initialize [

	statements := OrderedCollection new.
]

{ #category : #accessing }
ScpSequence >> statements [

	^ statements
]

{ #category : #accessing }
ScpSequence >> statements: anObject [

	statements := anObject
]

{ #category : #accessing }
ScpSequence >> temporaries [

	^ temporaries
]

{ #category : #accessing }
ScpSequence >> temporaries: anObject [

	temporaries := anObject
]
