Class {
	#name : 'ScpMethodCall',
	#superclass : 'ScpObjectEvent',
	#instVars : [
		'method',
		'arguments',
		'return'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'uml' }
ScpMethodCall class >> uml: aStream [

	super uml: aStream.
	
	self = ScpMethodCall ifFalse: [ ^ self ]. 
	aStream cr << self name << ' --* ' << ScpMethod name.
	aStream cr << self name << ' --* "*"' << ScpBindedVariable name.
	aStream cr << self name << ' -- ' << ScpMethodReturn name.
]

{ #category : 'accessing' }
ScpMethodCall >> arguments [

	^ arguments
]

{ #category : 'accessing' }
ScpMethodCall >> arguments: aBindedVariableList [

	arguments := aBindedVariableList
]

{ #category : 'accessing' }
ScpMethodCall >> method [

	^ method
]

{ #category : 'accessing' }
ScpMethodCall >> method: anObject [

	method := anObject
]

{ #category : 'accessing' }
ScpMethodCall >> return [

	^ return
]

{ #category : 'accessing' }
ScpMethodCall >> return: anObject [

	return := anObject
]
