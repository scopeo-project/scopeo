Class {
	#name : 'MyStack',
	#superclass : 'OrderedCollection',
	#classInstVars : [
		'instance'
	],
	#category : 'Scopeo-Data-',
	#package : 'Scopeo-Data',
	#tag : ''
}

{ #category : 'accessing' }
MyStack class >> instance [

	^ instance ifNil: [ instance := self new ].
]
