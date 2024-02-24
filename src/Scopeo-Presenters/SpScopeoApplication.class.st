Class {
	#name : #SpScopeoApplication,
	#superclass : #SpApplication,
	#category : #'Scopeo-Presenters'
}

{ #category : #initialization }
SpScopeoApplication >> newIconProvider [

	^ SpCompositeIconProvider new
		  addProvider: SpScopeoIconProvider new;
				  addProvider: StPharoDefaultIconProvider new;
		  yourself
]
