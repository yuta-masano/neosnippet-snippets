" こういうのを作る。
" #=========...
" #  title
" #=========...
function! g:NeosnippetSnippets_CommentLine() abort
    let maxColumn = 80
    let commentStr = strpart(&commentstring, 0, 1)

    let i = 0
    let line = ''
    while i < maxColumn - strlen(commentStr)
        let line = line . '='
        let i = i + 1
    endwhile
    let commentLine = commentStr . line

    let ret = input('title > ')
    let title = commentStr . '  ' . ret

    return join([commentLine, title, commentLine], "\n")
endfunction

" こういうのを作る。
" #---  title  ---...
function! g:NeosnippetSnippets_SubCommentLine() abort
    let maxColumn = 80
    let commentStr = strpart(&commentstring, 0, 1)

    let ret = input('title > ')
    let head = commentStr . '---' . '  ' . ret . '  '
    let currentCol = strwidth(head)
    let i = 0
    let tail = ''
    while i < maxColumn - currentCol
        let tail = tail . '-'
        let i = i + 1
    endwhile

    return head . tail
endfunction
