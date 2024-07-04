Class {
	#name : 'ScpDynamicElement',
	#superclass : 'ScpModelElement',
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'testing' }
ScpDynamicElement class >> isAbstract [

	^ self == ScpDynamicElement
]

{ #category : 'uml' }
ScpDynamicElement class >> uml [

	<script: 'self uml inspect'>

	| stream |
	stream := WriteStream with: '@startuml'.
	stream cr << '!theme plain'.
	stream cr << 'skinparam linetype ortho'.
	stream cr << 'title Object-oriented language semantic model'.
	stream cr.
	self subclassesDo: [ :c | 
		c uml: stream.
		stream cr
	].
	stream << '@enduml'.
	^ stream contents 
	
	
]
