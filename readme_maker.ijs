test =: 'Dane Weber'
directory =: 1!:0 '*'
dirs =: (<'----d-') = 4 {"1 directory
dirnames =: dirs # {."1 directory

NB. directories =: 13 : '({."1 (1!:0 y)) #~ (<''----d-'') = 4 {"1 (1!:0 y)' NB. y should be the filter to feed 1!:0
directories =: ([: ({."1) 1!:0) #~ (<'----d-') = 4 ({"1) 1!:0
dirnames =: directories '*'

capitalize =: a. {~ [: (_32&+@{. , }.) a. I. ]

outTitle =: < 'title' , 2 # LF
outHeader =: < 'header.md' , 2 # LF
outCategories =: < (<'### Categories',LF) ; < (<'- [') ,. (capitalize each dirnames) ,. (<'](#') ,. dirnames ,. (<')',LF)
outContents =: < (<LF,'---',LF,'### ') ,. dirnames ,. < LF

outputText =: outTitle ; outHeader ; outCategories ; outContents
outt =: ; < S:0 outputText
outt 1!:2 <'README.md'
exit ''


NB. ; < S:0 '## ' ; 'Folder' ; LF ; < (2 6 $ '- [' ; 'Item one' ; '](' ; 'item-one.md' ; ')' ; LF ; '- [' ; 'Item two' ; '](' ; 'item-two.md' ; ')' ; LF)


NB. Header from folder name.
NB. Intro text from root .md files
NB. Categories with in-page links of the [Helpful Hints](#Helpful Hints) variety
NB. Each category with bullet list of links to .md files in the following format:
NB. - [Delete Local Branches That Have Been Merged.md](git/delete-local-branches-that-have-been-merged.md)