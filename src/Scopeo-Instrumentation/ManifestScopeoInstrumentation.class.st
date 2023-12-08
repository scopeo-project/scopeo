"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestScopeoInstrumentation',
	#superclass : 'PackageManifest',
	#category : 'Scopeo-Instrumentation-Manifest',
	#package : 'Scopeo-Instrumentation',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestScopeoInstrumentation class >> ruleCollectionProtocolRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#ScpInstrumentation #methods: #false)) #'2023-12-08T11:35:46.462682+01:00') )
]
