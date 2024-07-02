Class {
	#name : 'PlantUMLDocumentor',
	#superclass : 'Object',
	#instVars : [
		'classes',
		'stream'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'api' }
PlantUMLDocumentor class >> document: aClassCollection [

	^ self new
		  classes: aClassCollection;
		  build
]

{ #category : 'building' }
PlantUMLDocumentor >> build [

	stream := WriteStream with: '@startuml'.
	stream << Character cr.
	classes do: [ :class | self buildClass: class ].
	stream << '@enduml'.
	^ stream contents
]

{ #category : 'building' }
PlantUMLDocumentor >> buildClass: class [

	stream << 'class ' << class name << Character cr.
	(classes includes: class superclass) ifTrue: [
		stream << class superclass name << ' <|-down- ' << class name.
	].
	stream nextPut: Character cr
]

{ #category : 'accessing' }
PlantUMLDocumentor >> classes: aClassCollection [

	classes := aClassCollection
]
