Class {
	#name : #ScpScopePresenterImpl,
	#superclass : #MolAbstractComponentImpl,
	#traits : 'ScpScopePresenter + ScpScopeEvents + ScpScopePresenterServices',
	#classTraits : 'ScpScopePresenter classTrait + ScpScopeEvents classTrait + ScpScopePresenterServices classTrait',
	#instVars : [
		'pane',
		'objectKeys',
		'objectValues',
		'objectEventsKeys',
		'objectEventsValues',
		'keysPane',
		'valuesPane'
	],
	#category : #'Scopeo-Presenter-Scope'
}
