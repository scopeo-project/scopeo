Class {
	#name : 'ScpMethodSeeker',
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
ScpMethodSeeker >> initialize [

	self matchPackages: OTAnyMatcher new.
	self matchClasses: OTAnyMatcher new.
	self matchMethods: OTAnyMatcher new
]

{ #category : 'parameters' }
ScpMethodSeeker >> matchClasses: aClassMatcher [

	classMatcher := aClassMatcher
]

{ #category : 'parameters' }
ScpMethodSeeker >> matchMethods: aMethodMatcher [

	methodMatcher := aMethodMatcher
]

{ #category : 'parameters' }
ScpMethodSeeker >> matchPackages: aPackageMatcher [

	packageMatcher := aPackageMatcher 
]

{ #category : 'services' }
ScpMethodSeeker >> methods [

	| packages classes |
	packages := self selectMatchingPackages: Smalltalk packages.
	classes := packages flatCollect: [ :p | self selectMatchingClassesOf: p ].
	^ classes flatCollect: [ :c | self selectMatchingMethodsOf: c ]
]

{ #category : 'private' }
ScpMethodSeeker >> selectMatchingClassesOf: aPackage [

	^ aPackage classes select: [ :class | classMatcher matches: class ]
]

{ #category : 'private' }
ScpMethodSeeker >> selectMatchingMethodsOf: aClass [

	^ aClass methods select: [ :method | methodMatcher matches: method ]
]

{ #category : 'private' }
ScpMethodSeeker >> selectMatchingPackages: aPackages [

	^ aPackages select: [ :package | packageMatcher matches: package ]
]
