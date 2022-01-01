# tindex.vim
A index for tex-math commands.

## Install

### For vim-plug

```vim
Plug 'Cassin01/tindex.vim'
command! TexCommands :call tindex#m_math_glossary()
nnoremap <silent> ,t :TexCommands<CR>

```

### Manually put the csv file at ``~/.config/nvim/``.

The file name is ``latex_commands.csv``.


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
"Omega",         "Ω"
"partial",       "∂"
"xi",            "ξ"
"delta",         "δ"
"gamma",         "γ"
"Gamma",         "Γ"
"bullet",        "∙"
"quad", "a 1 word space"
"qquad", "2 words space"
"mathbf", "太字(vector等)"
"mathbb", "黒板太字(集合(sets))"
"mathcal", "筆記体"
"textit", "イタリック"
"textgt", "ゴシック"
"KwRet", "Return (algorithm2e)"
"tcp*[h]{ ${1:comment} }\;", "コメント(algorithm2e)"
"mathcal" ,  "カリグラフィフォント"
```


## Usage

On Normal mode

``,t`` for entering the latex-math-index.

On the latex-math-index

``,t`` for the selecting the word that u want insert in ur text.

## configuration

```vim
" csv path
let g:tindex#index_path = '~/.config/nvim/init/main/latex_commands.csv'
```
