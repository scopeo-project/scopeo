Class {
	#name : #ScpTraceSourceSelectionBuilder,
	#superclass : #Object,
	#instVars : [
		'packageMatcher',
		'methodMatcher',
		'classMatcher'
	],
	#category : #'Scopeo-TraceRecorder-Model'
}

{ #category : #services }
ScpTraceSourceSelectionBuilder >> build [

	| selection |
	selection := ScpTraceSourceSelection new.
	selection packages: (self selectPackages: Smalltalk packages).
	selection classes:
		(selection packages flatCollect: [ :p | self selectClassesOf: p ]).
	selection methods: (selection classes flatCollect: [ :c |
			 self selectMethodsOf: c ]).
	^ selection
]

{ #category : #initialization }
ScpTraceSourceSelectionBuilder >> initialize [

	self matchPackages: OTAnyMatcher new.
	self matchClasses: OTAnyMatcher new.
	self matchMethods: OTAnyMatcher new
]

{ #category : #parameters }
ScpTraceSourceSelectionBuilder >> matchClasses: aClassMatcher [

	classMatcher := aClassMatcher
]

{ #category : #parameters }
ScpTraceSourceSelectionBuilder >> matchMethods: aMethodMatcher [

	methodMatcher := aMethodMatcher
]

{ #category : #parameters }
ScpTraceSourceSelectionBuilder >> matchPackages: aPackageMatcher [

	packageMatcher := aPackageMatcher 
]

{ #category : #private }
ScpTraceSourceSelectionBuilder >> selectClassesOf: aPackage [

	^ aPackage classes select: [ :c | classMatcher matches: c ]
]

{ #category : #private }
ScpTraceSourceSelectionBuilder >> selectMethodsOf: aClass [

	^ aClass methods select: [ :m | methodMatcher matches: m ]
]

{ #category : #private }
ScpTraceSourceSelectionBuilder >> selectPackages: aCollection [

	^ aCollection select: [ :p | packageMatcher matches: p ]
]
