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
		self dependencies: spec.
		self packages: spec 
	]
]

{ #category : 'accessing' }
BaselineOfScopeo >> dependencies: spec [

	spec baseline: 'ScopeoExecutionRecorder' with: [
		spec repository: 'github://scopeo-project/scopeo-execution-recorder:main' 
	].
]

{ #category : 'accessing' }
BaselineOfScopeo >> packages: spec [

	spec package: #'Scopeo-Presenters'.

]
