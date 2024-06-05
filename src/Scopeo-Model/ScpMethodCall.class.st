Class {
	#name : #ScpMethodCall,
	#superclass : #ScpObjectEvent,
	#instVars : [
		'method',
		'arguments',
		'return'
	],
	#category : 'Scopeo-Model'
}

{ #category : #accessing }
ScpMethodCall >> arguments [

	^ arguments
]

{ #category : #accessing }
ScpMethodCall >> arguments: aBindedVariableList [

	arguments := aBindedVariableList
]

{ #category : #accessing }
ScpMethodCall >> method [

	^ method
]

{ #category : #accessing }
ScpMethodCall >> method: anObject [

	method := anObject
]

{ #category : #accessing }
ScpMethodCall >> return [

	^ return
]

{ #category : #accessing }
ScpMethodCall >> return: anObject [

	return := anObject
]
