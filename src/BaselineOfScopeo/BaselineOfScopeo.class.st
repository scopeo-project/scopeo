Class {
	#name : #BaselineOfScopeo,
	#superclass : #Object,
	#category : #BaselineOfScopeo
}

{ #category : #baselines }
BaselineOfScopeo >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec
			baseline: 'Seeker'
			with: [ spec repository: 'github://ValentinBourcier/SeekerDebugger:main' ].
		spec package: 'Scopeo'
	]
]
