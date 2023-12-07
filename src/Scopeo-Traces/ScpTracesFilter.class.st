Class {
	#name : 'ScpTracesFilter',
	#superclass : 'Object',
	#instVars : [
		'packageMatcher',
		'methodMatcher',
		'classMatcher'
	],
	#category : 'Scopeo-Traces',
	#package : 'Scopeo-Traces'
}

{ #category : 'initialization' }
ScpTracesFilter >> initialize [

	self matchPackages: OTAnyMatcher new.
	self matchClasses: OTAnyMatcher new.
	self matchMethods: OTAnyMatcher new
]

{ #category : 'parameters' }
ScpTracesFilter >> matchClasses: aClassMatcher [

	classMatcher := aClassMatcher
]

{ #category : 'parameters' }
ScpTracesFilter >> matchMethods: aMethodMatcher [

	methodMatcher := aMethodMatcher
]

{ #category : 'parameters' }
ScpTracesFilter >> matchPackages: aPackageMatcher [

	packageMatcher := aPackageMatcher 
]

{ #category : 'services' }
ScpTracesFilter >> methods [

	| packages classes |
	packages := self selectMatchingPackages: Smalltalk packages.
	classes := packages flatCollect: [ :p | self selectMatchingClassesOf: p ].
	^ classes flatCollect: [ :c | self selectMatchingMethodsOf: c ]
]

{ #category : 'private' }
ScpTracesFilter >> selectMatchingClassesOf: aPackage [

	^ aPackage classes select: [ :class | classMatcher matches: class ]
]

{ #category : 'private' }
ScpTracesFilter >> selectMatchingMethodsOf: aClass [

	^ aClass methods select: [ :method | methodMatcher matches: method ]
]

{ #category : 'private' }
ScpTracesFilter >> selectMatchingPackages: aPackages [

	^ aPackages select: [ :package | packageMatcher matches: package ]
]