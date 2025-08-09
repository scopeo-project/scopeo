Class {
	#name : 'ScpMethodsUsingObjectAsArg',
	#superclass : 'ScpObjectCentricQuestion',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'accessing' }
ScpMethodsUsingObjectAsArg class >> label [

	^ 'All messages passing <an Object> in argument, in <scope>'
]

{ #category : 'testing' }
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
	
	^ 'All methods using "', subject asString, '" in arguments, in scope: ', scope label
]
