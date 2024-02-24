Class {
	#name : #ScpTraceSourceBrowserSelection,
	#superclass : #Object,
	#instVars : [
		'packages',
		'classes',
		'methods',
		'model'
	],
	#category : #'Scopeo-TraceRecorder-Source-Browser-UI'
}

{ #category : #actions }
ScpTraceSourceBrowserSelection >> buildTraceSourceSelection [

	^ ScpTraceSourceSelection new
		                        packages: packages;
		                        classes: classes;
		                        methods: methods;
		                        yourself.
]

{ #category : #accessing }
ScpTraceSourceBrowserSelection >> classes [

	^ classes
]

{ #category : #accessing }
ScpTraceSourceBrowserSelection >> classes: anObject [

	classes := anObject
]

{ #category : #testing }
ScpTraceSourceBrowserSelection >> hasMethodsSelected [

	^ methods isNotEmpty
]

{ #category : #initialization }
ScpTraceSourceBrowserSelection >> initialize [

	
	packages := OrderedCollection empty.
	classes := OrderedCollection empty.
	methods := OrderedCollection empty
]

{ #category : #actions }
ScpTraceSourceBrowserSelection >> initializeFromTraceSourceSelection: aScpTraceSourceSelection [
]

{ #category : #testing }
ScpTraceSourceBrowserSelection >> isClassSelected: aClass [

	^ classes includes: aClass
]

{ #category : #testing }
ScpTraceSourceBrowserSelection >> isMethodSelected: aMethod [

	^ methods includes: aMethod
]

{ #category : #testing }
ScpTraceSourceBrowserSelection >> isPackageSelected: aPackage [

	^ packages includes: aPackage
]

{ #category : #accessing }
ScpTraceSourceBrowserSelection >> methods [

	^ methods
]

{ #category : #accessing }
ScpTraceSourceBrowserSelection >> methods: anObject [

	methods := anObject
]

{ #category : #accessing }
ScpTraceSourceBrowserSelection >> model [

	^ model
]

{ #category : #accessing }
ScpTraceSourceBrowserSelection >> model: aScpTraceSourceBrowserPresentationModel [

	model := aScpTraceSourceBrowserPresentationModel
]

{ #category : #accessing }
ScpTraceSourceBrowserSelection >> packages [

	^ packages
]

{ #category : #accessing }
ScpTraceSourceBrowserSelection >> packages: anObject [

	packages := anObject
]

{ #category : #actions }
ScpTraceSourceBrowserSelection >> selectAllClasses [

	classes := model items classes.
	model announceUpdate
]

{ #category : #actions }
ScpTraceSourceBrowserSelection >> selectAllMethods [

	methods := model items methods.
	model announceUpdate
]

{ #category : #actions }
ScpTraceSourceBrowserSelection >> selectAllPackages [

	packages := model items packages.
	model announceUpdate
]

{ #category : #actions }
ScpTraceSourceBrowserSelection >> selectClass: aClass [

	classes add: aClass.
	model announceUpdate 
]

{ #category : #actions }
ScpTraceSourceBrowserSelection >> selectMethod: aMethod [

	methods add: aMethod.
	model announceUpdate 
]

{ #category : #actions }
ScpTraceSourceBrowserSelection >> selectPackage: aPackage [

	packages add: aPackage.
	model announceUpdate 
]

{ #category : #actions }
ScpTraceSourceBrowserSelection >> unselectAllClasses [

	classes := OrderedCollection empty.
	methods := OrderedCollection empty.
	model announceUpdate 
]

{ #category : #actions }
ScpTraceSourceBrowserSelection >> unselectAllMethods [

	methods := OrderedCollection empty.
	model announceUpdate 
]

{ #category : #actions }
ScpTraceSourceBrowserSelection >> unselectAllPackages [

	packages := OrderedCollection empty.
	classes := OrderedCollection empty.
	methods := OrderedCollection empty.
	model announceUpdate 
]

{ #category : #actions }
ScpTraceSourceBrowserSelection >> unselectClass: aClass [

	classes remove: aClass.
	model announceUpdate 
]

{ #category : #actions }
ScpTraceSourceBrowserSelection >> unselectMethod: aMethod [

	methods remove: aMethod.
	model announceUpdate 
]

{ #category : #actions }
ScpTraceSourceBrowserSelection >> unselectPackage: aPackage [

	packages remove: aPackage.
	model announceUpdate 
]
