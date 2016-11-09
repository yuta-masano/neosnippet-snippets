"---  g:NeosnippetSnippets_CommentLine()  --------------------------------------
" こういうのを作る。
" #=========...
" #  title
" #=========...
function! g:NeosnippetSnippets_CommentLine() abort
    let maxColumn = 80
    let commentStr = split(split(tcomment#GuessCommentType().commentstring, ' ')[0], '%s')[0]

    let i = 0
    let line = ''
    while i < maxColumn - len(commentStr)
        let line = line . '='
        let i = i + 1
    endwhile
    let commentLine = join([commentStr, line], '')

    let ret = input('title > ')
    let title = join([commentStr, '  ', ret], '')

    return join([commentLine, title, commentLine], "\n")
endfunction

"---  g:NeosnippetSnippets_SubCommentLine()  -----------------------------------
" こういうのを作る。
" #---  title  ---...
function! g:NeosnippetSnippets_SubCommentLine() abort
    let maxColumn = 80
    let commentStr = split(split(tcomment#GuessCommentType().commentstring, ' ')[0], '%s')[0]

    let head = join([commentStr, '---', '  '], '')

    let ret = input('title > ')
    let title = join([ret , '  '], '')

    let currentCol = len(head) + len(title)
    let i = 0
    let tail = ''
    while i < maxColumn - currentCol
        let tail = tail . '-'
        let i = i + 1
    endwhile

    return join([head, title, tail], '')
endfunction
