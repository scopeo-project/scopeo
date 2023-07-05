Class {
	#name : #ScpScope,
	#superclass : #Object,
	#instVars : [
		'scope',
		'announcer'
	],
	#category : #'Scopeo-Logic'
}

{ #category : #adding }
ScpScope >> add: anElement labeled: aLabel [

	scope at: aLabel put: anElement
]

{ #category : #accessing }
ScpScope >> announcer [

	^ announcer
]

{ #category : #accessing }
ScpScope >> associations [

	^ scope associations
]

{ #category : #accessing }
ScpScope >> contents [

	^ scope values
]

{ #category : #initialization }
ScpScope >> initialize [

	scope := Dictionary new.
	announcer := Announcer new
]

{ #category : #accessing }
ScpScope >> labels [

	^ scope keys
]

{ #category : #notifying }
ScpScope >> notify [

	^ self announcer announce:
		  (ScpScopeUpdated new associations: self associations)
]

{ #category : #removing }
ScpScope >> remove: aLabel [

	scope removeKey: aLabel.
	self notify
]
