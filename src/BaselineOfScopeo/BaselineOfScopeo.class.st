Class {
	#name : #BaselineOfScopeo,
	#superclass : #BaselineOf,
	#category : #BaselineOfScopeo
}

{ #category : #baselines }
BaselineOfScopeo >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self dependencies: spec.
		self packages: spec 
	]
]

{ #category : #accessing }
BaselineOfScopeo >> dependencies: spec [

		spec baseline: 'ScopeoTraceRecorder' with: [
		spec repository:
			'github://scopeo-project/scopeo-trace-recorder:main' ].
]

{ #category : #accessing }
BaselineOfScopeo >> packages: spec [

	spec package: #'Scopeo-Model'.
	spec package: #'Scopeo-Predicates'.

	spec package: #Scopeo
]
