syn cluster synExcludes contains=javaComment,javaLineComment,javaDocComment,javaCommentTitle,javaString,javaDocTags,javaDocSeeTag,javaDocParam

" exceptions
syn match imExceptions /\<\w*Exception\>/ containedin=ALLBUT,@synExcludes
syn match imExceptions /\<\w*Error\>/ containedin=ALLBUT,@synExcludes
syn keyword imExceptions Exception containedin=ALLBUT,@synExcludes
syn keyword imExceptions Throwable containedin=ALLBUT,@synExcludes

" Give classes a slight coloring
syn match imClass /\<[A-Z][a-z0-9_]\w*\>/ containedin=ALLBUT,@synExcludes

" _memberVariables
syn match memVars /\<_[a-z0-9A-Z]*\>/ containedin=ALLBUT,@synExcludes
