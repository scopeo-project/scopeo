Class {
	#name : 'ScpKeywordMessageSent',
	#superclass : 'ScpMessageEvent',
	#instVars : [
		'receiver'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'accessing' }
ScpKeywordMessageSent >> receiver [

	^ self object
]

{ #category : 'accessing' }
ScpKeywordMessageSent >> sender [
	
	^ self object
]
