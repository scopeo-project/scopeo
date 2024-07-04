Class {
	#name : 'ScpModelElement',
	#superclass : 'Object',
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'testing' }
ScpModelElement class >> isAbstract [

	^ self == ScpModelElement
]

{ #category : 'uml' }
ScpModelElement class >> uml [

	<script: 'self uml inspect'>

	| stream |
	stream := WriteStream with: '@startuml'.
	stream cr << '!theme plain'.
	stream cr << 'skinparam linetype ortho'.
	stream cr.
	self subclassesDo: [ :c | 
		c uml: stream.
		stream cr
	].
	stream << '@enduml'.
	^ stream contents 
	
	
]

{ #category : 'uml' }
ScpModelElement class >> uml: aStream [

	self isAbstract 
		ifTrue: [ aStream << 'abstract ' ]
		ifFalse: [ aStream << 'class ' ].
	aStream << self name.
	self subclassesDo: [ :c | 
		c uml: aStream cr.
		aStream cr << self name << ' <|-- ' << c name
	]	
]
