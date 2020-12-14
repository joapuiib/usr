" dont parse urls eruby comments
syn match UrlNoSpellComment "\w\+:\/\/[^[:space:]]\+" contains=@NoSpell containedin=erubyComment
highlight def link UrlNoSpellComment Comment
