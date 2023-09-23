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
			with: [ spec repository: 'github://OpenSmock/Molecule' ].
		spec 
			baseline: 'DebuggableASTInterpreter' 
			with: [
				spec repository: 'github://adri09070/DebuggableASTInterpreter:optimized-code-switch' 
			].
		spec package: 'Scopeo-Scenario' 
	]
]
