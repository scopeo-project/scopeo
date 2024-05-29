Class {
	#name : 'ScpOldMethodCall',
	#superclass : 'Object',
	#instVars : [
		'callingMethod',
		'calledMethod'
	],
	#category : 'Scopeo-Model-Deprecated',
	#package : 'Scopeo-Model',
	#tag : 'Deprecated'
}

{ #category : 'accessing' }
ScpOldMethodCall >> calledMethod [

	^ calledMethod
]

{ #category : 'accessing' }
ScpOldMethodCall >> calledMethod: anObject [

	calledMethod := anObject
]

{ #category : 'accessing' }
ScpOldMethodCall >> callingMethod [

	^ callingMethod
]

{ #category : 'accessing' }
ScpOldMethodCall >> callingMethod: anObject [

	callingMethod := anObject
]
