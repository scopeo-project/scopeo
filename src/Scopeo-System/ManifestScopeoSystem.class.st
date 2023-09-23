"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestScopeoSystem,
	#superclass : #PackageManifest,
	#category : #'Scopeo-System-Manifest'
}

{ #category : #'code-critics' }
ManifestScopeoSystem class >> ruleUnaryAccessingMethodWithoutReturnRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(
	     #( #( #RGMetaclassDefinition #( #'ScopeoSystem class'
	              #ScopeoSystem ) )
	        #'2023-09-23T12:33:24.064073+02:00' ) )
]
