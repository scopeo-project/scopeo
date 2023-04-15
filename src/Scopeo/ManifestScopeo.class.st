"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestScopeo,
	#superclass : #PackageManifest,
	#category : #'Scopeo-Manifest'
}

{ #category : #'code-critics' }
ManifestScopeo class >> ruleCollectionProtocolRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'ObjectsInteractions class' #fromEvents: #true)) #'2023-04-14T11:32:57.17228+02:00') )
]
