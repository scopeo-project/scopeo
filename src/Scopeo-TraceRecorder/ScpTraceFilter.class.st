Class {
	#name : 'ScpTraceFilter',
	#superclass : 'Object',
	#instVars : [
		'packageMatcher',
		'methodMatcher',
		'classMatcher'
	],
	#category : 'Scopeo-TraceRecorder-Model',
	#package : 'Scopeo-TraceRecorder',
	#tag : 'Model'
}

{ #category : 'initialization' }
ScpTraceFilter >> initialize [

	self matchPackages: OTAnyMatcher new.
	self matchClasses: OTAnyMatcher new.
	self matchMethods: OTAnyMatcher new
]

{ #category : 'parameters' }
ScpTraceFilter >> matchClasses: aClassMatcher [

	classMatcher := aClassMatcher
]

{ #category : 'parameters' }
ScpTraceFilter >> matchMethods: aMethodMatcher [

	methodMatcher := aMethodMatcher
]

{ #category : 'parameters' }
ScpTraceFilter >> matchPackages: aPackageMatcher [

	packageMatcher := aPackageMatcher 
]

{ #category : 'services' }
ScpTraceFilter >> methods [

	| packages classes |
	packages := self selectMatchingPackages: Smalltalk packages.
	classes := packages flatCollect: [ :p | self selectMatchingClassesOf: p ].
	^ classes flatCollect: [ :c | self selectMatchingMethodsOf: c ]
]

{ #category : 'private' }
ScpTraceFilter >> selectMatchingClassesOf: aPackage [

	^ aPackage classes select: [ :class | classMatcher matches: class ]
]

{ #category : 'private' }
ScpTraceFilter >> selectMatchingMethodsOf: aClass [

	^ aClass methods select: [ :method | methodMatcher matches: method ]
]

{ #category : 'private' }
ScpTraceFilter >> selectMatchingPackages: aPackages [

	^ aPackages select: [ :package | packageMatcher matches: package ]
]
