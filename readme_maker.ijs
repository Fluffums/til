test =: 'Dane Weber'
directory =: 1!:0 '*'
dirs =: (<'----d-') = 4 {"1 directory
dirnames =: dirs # {."1 directory

NB. directories =: 13 : '({."1 (1!:0 y)) #~ (<''----d-'') = 4 {"1 (1!:0 y)' NB. y should be the filter to feed 1!:0
directories =: ([: ({."1) 1!:0) #~ (<'----d-') = 4 ({"1) 1!:0
dirnames =: directories '*'

capitalize =: a. {~ [: ((_32&+)^:(>&96 *. <&123)@{. , }.) a. I. ] NB. First character of a string, if a lowercase ASCII letter, is swapped to its capital.
fret =: 13 : '(0;(2 2 2 $ 0 0  1 1  0 3  1 0);((# = a. i.~ ]) x)) ;: y' NB. Usage is ' -_' fret '3-7 X-ray glasses v_2'
whiteList =. 13 : 'y #~ (# x) > x i. y' NB. 'ABC' whiteList 'Alpha Beta NAB'

prettyDirNames =: }.&; each capitalize L:0 ((<' ') ,. ' -_.'&fret) each dirnames

NB. Category links
NB. The code that creates the anchors is here: https://github.com/jch/html-pipeline/blob/master/lib/html/pipeline/toc_filter.rb
NB. 1 - It downcases the string
NB. 2 - remove anything that is not a letter, number, space or hyphen (see the source for how Unicode is handled)
NB. 3 - changes any space to a hyphen.
NB. 4 - If that is not unique, add "-1", "-2", "-3",... to make it unique

NB. Need a toLowerCase function

spaceToHyphenDirNames =: }.&; each ((<'-') ,. ' '&fret) each dirnames



outTitle =: < 'title' , 2 # LF
outHeader =: < 'header.md' , 2 # LF
outCategories =: < (<'### Categories',LF) ; < (<'- [') ,. prettyDirNames ,. (<'](#') ,. dirnames ,. (<')',LF)
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