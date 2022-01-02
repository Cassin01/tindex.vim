# tindex.vim
A index for tex-math commands.

## Install

### For vim-plug

```vim
Plug 'Cassin01/tindex.vim'
command! TexCommands :call tindex#m_math_glossary()
nnoremap <silent> ,t :TexCommands<CR>
let g:tindex#index_path = '~/.config/nvim/latex_commands.csv'
```

### Manually put the csv file at ``g:tindex#index_path``.

```csv
Command, Description
"mathbb{R}",     "ℝ"
"mathbb{z}",     "ℤ"
"mathbb{n}",     "ℕ"
"subset",        "⊂"
"subseteq",      "⊆"
"supset",        "⊃"
"in",            "∈"
"cap",           "∩"
"cup",           "∪"
"mid",           "∣"
"notin",         "∉"
"eq",            "="
"neq",           "≠"
"sim",           "∼"
"simeq",         "≃"
"approx",        "≈"
"fallingdotseq", "≒"
"risingdotseq",  "≓"
"equiv",         "≡"
"geq",           "≥"
"geqq",          "≧"
"leq",           "≤"
"leqq",          "≦"
"gg",            "≫"
"ll",            "≪"
"oplus",         "⊕"
"cdot",          "⋅"
"bot",           "⊥"
"sum",           "∑"
"prod",          "∏"
"int",           "∫"
"infty",         "∞"
"forall",        "∀"
"exists",        "∃"
"leftarrow",     "←"
"rightarrow",    "→"
"Leftarrow",     "⇐"
"Rightarrow",    "⇒"
"Leftrightarrow","⇔"
"theta",         "θ"
"phi",           "ϕ"
"psi",           "ψ"
"Omega",         "Ω"
"partial",       "∂"
"xi",            "ξ"
"delta",         "δ"
"gamma",         "γ"
"Gamma",         "Γ"
"bullet",        "∙"
"KwRet",         "Return (algorithm2e)"
"tcp*[h]{ ${1:comment} }\;", "comment (algorithm2e)"
```


## Usage

On Normal mode

``,t`` for entering the latex-math-index.

On the latex-math-index

``,t`` for the selecting the word that u want insert in ur text.
