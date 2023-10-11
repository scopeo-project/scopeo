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
		].

		spec package: #'Scopeo-DataModel'.
		spec package: #'Scopeo-DataPredicates'.
		spec package: #'Scopeo-DataScanner' with: [
			spec requires: #( #'Molecule' #'Molecule-IDE') 
		].
		

		spec package: #'Scopeo-DataBuffer' with: [
			spec requires: #( #'Molecule' #'Molecule-IDE' #'Scopeo-DataScanner') 
		].
		spec package: #'Scopeo-DataLogger' with: [
			spec requires: #( #'Molecule' #'Molecule-IDE' #'Scopeo-DataBuffer') 
		].
		spec package: #'Scopeo-DataStorage' with: [
			spec requires: #( #'Molecule' #'Molecule-IDE' #'Scopeo-DataBuffer') 
		].

		spec package: #'Scopeo-Model-Scope' with: [
			spec requires: #( #'Molecule' #'Molecule-IDE') 
		].
		spec package: #'Scopeo-Model-Search' with: [
			spec requires:
				#( #'Molecule' #'Molecule-IDE' #'Scopeo-Presenter-Traits' #'Scopeo-DataStorage') 
		].

		spec package: #'Scopeo-Presenter-Traits'.

		spec package: #'Scopeo-Presenter-Results' with: [
			spec requires:
				#( #'Molecule' #'Molecule-IDE' #'Scopeo-Presenter-Traits' #'Scopeo-Model-Search' #'Scopeo-Model-Scope') 
		].
		spec package: #'Scopeo-Presenter-Scope' with: [
			spec requires:
				#( #'Molecule' #'Molecule-IDE' #'Scopeo-Presenter-Traits' #'Scopeo-Model-Scope') 
		].
		spec package: #'Scopeo-Presenter-Search' with: [
			spec requires:
				#( #'Molecule' #'Molecule-IDE' #'Scopeo-Presenter-Traits' #'Scopeo-Model-Search') 
		].
]
