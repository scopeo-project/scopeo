Class {
	#name : 'ScpMethodReturn',
	#superclass : 'ScpObjectEvent',
	#instVars : [
		'methodCall'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'uml' }
ScpMethodReturn class >> uml: aStream [

	super uml: aStream.
	
	aStream cr << self name << ' -* ' << ScpMethodCall name.
]

{ #category : 'accessing' }
ScpMethodReturn >> methodCall [
	
	^ methodCall
]

{ #category : 'accessing' }
ScpMethodReturn >> methodCall: aMethodCall [
	
	methodCall := aMethodCall
]
