Class {
	#name : 'SpScopeoApplication',
	#superclass : 'SpApplication',
	#category : 'Scopeo-Presenters',
	#package : 'Scopeo-Presenters'
}

{ #category : 'initialization' }
SpScopeoApplication >> newIconProvider [

	^ SpCompositeIconProvider new
		  addProvider: StPharoDefaultIconProvider new;
		  addProvider: SpScopeoIconProvider new;
		  yourself
]
