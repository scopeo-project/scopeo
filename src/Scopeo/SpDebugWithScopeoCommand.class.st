Class {
	#name : 'SpDebugWithScopeoCommand',
	#superclass : 'SpCodeSelectionCommand',
	#category : 'Scopeo',
	#package : 'Scopeo'
}

{ #category : 'default' }
SpDebugWithScopeoCommand class >> defaultIconName [

	^ #exception
]

{ #category : 'default' }
SpDebugWithScopeoCommand class >> defaultName [

	^ 'Debug it with Scopeo'
]

{ #category : 'default' }
SpDebugWithScopeoCommand class >> defaultShortcutKey [

	^ $x shift meta mac | $x alt control win | $x alt control unix
]

{ #category : 'execution' }
SpDebugWithScopeoCommand >> execute [

	| selection |
	selection := self context selectedTextOrLine.
	selection ifEmpty: [ ^ '' ].
	
	(Scopeo openOn: selection) inspect.
	
	
	
	self inform: 'Scopeo: executing a code snippet '
]
