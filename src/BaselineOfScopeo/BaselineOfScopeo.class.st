Class {
	#name : #BaselineOfScopeo,
	#superclass : #BaselineOf,
	#category : #BaselineOfScopeo
}

{ #category : #baselines }
BaselineOfScopeo >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec
			baseline: 'Molecule'
			with: [ spec repository: 'github://OpenSmock/Molecule:main/src' ].
		spec
			baseline: 'Toplo'
			with: [ spec repository: 'github://plantec/Toplo/src' ].
		spec baseline: 'DebuggableASTInterpreter' with: [
			spec repository:
				'github://adri09070/DebuggableASTInterpreter:optimized-code-switch' ].
		]
]
