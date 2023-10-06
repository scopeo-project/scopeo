"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestScopeoScope,
	#superclass : #PackageManifest,
	#category : #'Scopeo-Scope-Manifest'
}

{ #category : #'code-critics' }
ManifestScopeoScope class >> ruleCollectionMessagesToExternalObjectRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#'Scopeo-Scope')) #'2023-10-06T14:39:24.36503+02:00') )
]
