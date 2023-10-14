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
			baseline: 'Toplo'
			with: [ spec repository: 'github://plantec/Toplo/src' ].
		spec baseline: 'DebuggableASTInterpreter' with: [
			spec repository:
				'github://adri09070/DebuggableASTInterpreter:optimized-code-switch' ] ].

	spec package: #'Scopeo-DataModel'.
	spec package: #'Scopeo-DataPredicates'.
	spec
		package: #'Scopeo-DataScanner'
		with: [ spec requires: #( #DebuggableASTInterpreter ) ].

	spec
		package: #'Scopeo-DataBuffer'with: [ spec requires: #( #'Scopeo-DataScanner' ) ].
	spec
		package: #'Scopeo-DataLogger'
		with: [ spec requires: #( #'Scopeo-DataBuffer' ) ].
	spec
		package: #'Scopeo-DataStorage'
		with: [ spec requires: #( #'Scopeo-DataBuffer' ) ].

	spec package: #'Scopeo-Model-Scope'.
	spec package: #'Scopeo-Model-Search' with: [
		spec requires: #( #'Scopeo-Presenter-Traits'
		   #'Scopeo-DataStorage' ) ].

	spec package: #'Scopeo-Presenter-Traits'.

	spec package: #'Scopeo-Presenter-Results' with: [
		spec requires: #( #'Scopeo-Presenter-Traits'
			   #'Scopeo-Model-Search' #'Scopeo-Model-Scope' ) ].
	spec package: #'Scopeo-Presenter-Scope' with: [
		spec requires: #( #'Scopeo-Presenter-Traits'
		   #'Scopeo-Model-Scope' ) ].
	spec package: #'Scopeo-Presenter-Search' with: [
		spec requires:
			#( #'Scopeo-Presenter-Traits' #'Scopeo-Model-Search' ) ]
]
