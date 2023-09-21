Class {
	#name : #BaselineOfScopeo,
	#superclass : #BaselineOf,
	#category : #BaselineOfScopeo
}

{ #category : #baselines }
BaselineOfScopeo >> baseline: spec [

	<baseline>
	spec for: #common do: [ "spec
			baseline: 'Seeker'
			with: [ spec repository: 'github://ValentinBourcier/SeekerDebugger:main' ].
			spec package: 'Scopeo'.
		spec package: 'Scopeo-UI'."
		spec
			baseline: 'Chest'
			with: [ spec repository: 'github://ValentinBourcier/Chest:master' ].
		""
		spec package: 'Scopeo-Scenario' ]
]
