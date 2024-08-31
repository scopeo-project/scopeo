Class {
	#name : 'ScpMessageEvent',
	#superclass : 'ScpObjectEvent',
	#instVars : [
		'selector',
		'arguments',
		'return'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'accessing' }
ScpMessageEvent >> arguments [

	^ arguments
]

{ #category : 'accessing' }
ScpMessageEvent >> arguments: aBindedVariableList [

	arguments := aBindedVariableList
]

{ #category : 'accessing' }
ScpMessageEvent >> receiver [

	self subclassResponsibility
]

{ #category : 'accessing' }
ScpMessageEvent >> return [

	^ return
]

{ #category : 'accessing' }
ScpMessageEvent >> return: anObject [

	return := anObject
]

{ #category : 'accessing' }
ScpMessageEvent >> selector [

	^ selector
]

{ #category : 'accessing' }
ScpMessageEvent >> selector: anObject [

	selector := anObject
]

{ #category : 'accessing' }
ScpMessageEvent >> sender [

	self subclassResponsibility
]
