Class {
	#name : 'ScpMethodsUsingObjectAsArg',
	#superclass : 'ScpObjectCentricQuestion',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'accessing' }
ScpMethodsUsingObjectAsArg class >> label [

	^ 'All methods using <an Object> in argument, in <scope>'
]

{ #category : 'as yet unclassified' }
ScpMethodsUsingObjectAsArg >> isMethodMatching: aScpMethodTrace [

	| matching |

	matching := false.

	(aScpMethodTrace arguments select: [ :a | a == subject ]) do: [ :a |
		self add: a reference: aScpMethodTrace.
		matching := true.
	].

	^ matching 
]

{ #category : 'testing' }
ScpMethodsUsingObjectAsArg >> isSubjectValid [

	^ true
]

{ #category : 'accessing' }
ScpMethodsUsingObjectAsArg >> label [
	
	^ 'All methods using "', subject asString , '-' , subject hash asString , '" in arguments, in scope: ', scope label
]
