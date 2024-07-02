Class {
	#name : 'ScpStaticElement',
	#superclass : 'ScpModelElement',
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'testing' }
ScpStaticElement class >> isAbstract [

	^ self == ScpStaticElement
]

{ #category : 'uml' }
ScpStaticElement class >> uml [

	<script: 'self uml inspect'>

	| stream |
	stream := WriteStream with: '@startuml'.
	stream cr << '!theme plain'.
	stream cr << 'title Object-oriented language syntax model'.
	stream cr.
	self subclassesDo: [ :c | 
		c uml: stream.
		stream cr
	].
	stream << '@enduml'.
	^ stream contents 
	
	
]
