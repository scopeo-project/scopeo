Class {
	#name : 'BaselineOfScopeo',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfScopeo',
	#package : 'BaselineOfScopeo'
}

{ #category : 'baselines' }
BaselineOfScopeo >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec baseline: 'DebuggableASTInterpreter' with: [
			spec repository:
				'github://adri09070/DebuggableASTInterpreter:optimized-code-switch' ].

		spec package: #'Scopeo-Traces-Tests'.
		spec package: #'Scopeo-Traces'.
		spec package: #'Scopeo-Model'.
		spec package: #'Scopeo-Predicates'.
		spec package: #'Scopeo-Presenters'.
		spec package: #Scopeo ]
]
