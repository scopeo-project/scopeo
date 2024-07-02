Class {
	#name : 'UMLDocumentor',
	#superclass : 'Object',
	#instVars : [
		'classes',
		'stream'
	],
	#category : 'Scopeo-Model',
	#package : 'Scopeo-Model'
}

{ #category : 'api' }
UMLDocumentor class >> document: aClassCollection [

	^ self new
		  classes: aClassCollection;
		  build
]

{ #category : 'building' }
UMLDocumentor >> build [

	stream := WriteStream with: 'digraph {
graph [rankdir=BT, splines=ortho, concentrate=true];
node [shape=plain];
'.
	classes do: [ :class | self buildClass: class ].
	stream nextPut: $}.
	^ stream contents
]

{ #category : 'building' }
UMLDocumentor >> buildClass: class [

	stream << class name
	<<
		' [label=<<table border="0" cellborder="1" cellspacing="0" cellpadding="4">
	<tr><td><b>' << class name << '</b></td></tr>
	<tr><td>'.

	class instVarNames ifNotEmpty: [ :instVars |
		stream << '
		<table border="0" cellborder="0" cellspacing="0">'.
		instVars do: [ :instVar |
			stream << '
			<tr><td align="left">- ' << instVar << '</td></tr>' ].
		stream << '
		</table>' ].
	stream << '
	</td></tr>
	<tr><td>'.

	class methods ifNotEmpty: [ :methods |
		stream << '
		<table border="0" cellborder="0" cellspacing="0">'.
		methods do: [ :method |
			stream << '
			<tr><td align="left">+ ' << method selector << '</td></tr>' ].
		stream << '
		</table>' ].
	stream << '
	</td></tr>
</table>>];'.

	(classes includes: class superclass) ifTrue: [
		stream << '
' << class name << ' -> ' << class superclass name
		<< ' [arrowhead=onormal];' ].

	stream nextPut: Character cr
]

{ #category : 'accessing' }
UMLDocumentor >> classes: aClassCollection [

	classes := aClassCollection
]
