Class {
	#name : #MyStack,
	#superclass : #OrderedCollection,
	#classInstVars : [
		'instance'
	],
	#category : 'Scopeo-Data-'
}

{ #category : #accessing }
MyStack class >> instance [

	^ instance ifNil: [ instance := self new ].
]
