local lush = require('lush')
local hsl = lush.hsl

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_function)
  local sym = injected_function.sym
  black      = hsl("#191919")
  green      = hsl("#97e023")
  orange     = hsl("#fa8419")
  yellow     = hsl("#dfd561")
  purple     = hsl("#9c64fe")
  red        = hsl("#f3005f")
  cyan       = hsl("#57d1ea")
  blue       = hsl("#0e6172")
  grey       = hsl("#929276")
  grey_light = hsl("#c4c4b5")
  white      = hsl("#f6f6ee")
  return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.

    Normal { bg = black, fg = white },
    NormalFloat { Normal },

    -- NormalNC     { }, -- normal text in non-current windows
    Folded       { fg = Normal.fg.da(20), bg = Normal.bg.li(5)}, -- Line used for closed folds
    EndOfBuffer  { bg = black.da(10), fg = black.da(10) }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.


    Cursor       { bg = Normal.fg }, -- Character under the cursor
    lCursor      { Cursor }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM     { Cursor }, -- Like Cursor, but used when in IME mode |CursorIM|
    MatchParen   { bg = grey }, -- Character under the cursor
    TermCursor   { Cursor }, -- Cursor in a focused terminal
    TermCursorNC { bg = Cursor.bg.da(40)}, -- Cursor in an unfocused terminal

    cursor_pos   { bg = Normal.bg.li(5) },
    CursorColumn { cursor_pos }, --  Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { bg = Normal.bg.li(5)}, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    ColorColumn  { cursor_pos }, -- Columns set with 'colorcolumn'
    CursorLineNr { bg = CursorLine.bg, fg = CursorLine.bg.li(20) }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.

    Pmenu        { bg = Normal.bg.li(10), fg = white }, -- Popup menu: Normal item.
    PmenuSel     { bg = Normal.bg.li(20), fg = cyan }, -- Popup menu: Selected item.
    PmenuSbar    { bg = Normal.bg }, -- Popup menu: Scrollbar.
    PmenuThumb   { bg = grey }, -- Popup menu: Thumb of the scrollbar.
    
    VertSplit    { fg = Normal.bg.li(20) }, -- Column separating vertically split windows
    LineNr       { fg = Normal.bg.li(20), bg = Normal.bg.da(10) }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    SignColumn   { LineNr }, -- Column where |signs| are displayed

    DiffAdd      { bg = cyan.da(60), fg = cyan}, -- Diff mode: Added line |diff.txt|
    DiffChange   { bg = green.da(60), fg = green}, -- Diff mode: Changed line |diff.txt|
    DiffDelete   { bg = red.da(60), fg = red}, -- Diff mode: Deleted line |diff.txt|
    DiffText     { fg = red.da(60) , bg = yellow }, -- Diff mode: Changed text within a changed line |diff.txt|

    Directory    { fg = cyan }, -- Directory names (and other special names in listings)

    -- Conceal      { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    ErrorMsg     { fg = red }, -- Error messages on the command line
    -- FoldColumn   { }, -- 'foldcolumn'
    -- IncSearch    { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute   { }, -- |:substitute| replacement text highlighting
    ModeMsg      { fg = Normal.fg }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      { fg = blue }, -- |more-prompt|
    -- NonText      { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Whitespace   { bg = Normal.bg, fg = Normal.bg.li(20) }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    Question     { fg=cyan }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine { fg=cyan }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.

    Search       { bg = Normal.bg.li(20), fg = Normal.fg }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    IncSearch       { bg = Normal.bg.li(20), fg = Normal.fg }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.

    -- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|

    SpellBad     { gui = 'undercurl', sp = red }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise. 
    SpellCap     { gui = 'undercurl', sp = yellow }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal   { gui = 'undercurl', sp = blue }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare    { gui = 'undercurl', sp = purple }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

    StatusLine   { fg = Normal.fg, bg = Normal.bg.da(10) }, -- Status line of current window
    StatusLineNC { fg = grey, bg = Normal.bg }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine      { fg = grey, bg = Normal.bg }, -- Tab pages line, not active tab page label
    TabLineFill  { bg = Normal.bg.li(10) }, -- Tab pages line, where there are no labels
    -- TabLineSel   { }, -- Tab pages line, active tab page label
        
    Title        { fg = red, gui = "bold" }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual       { CursorLine }, -- Visual mode selection
    VisualNOS    { Visual }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { fg = yellow }, -- Warning messages
    Winseparator { fg = Normal.bg.li(40) }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    FloatBorder  { fg = Normal.bg.li(40) },
    FloatShadow { fg = Normal.bg.li(40) },
    -- WildMenu     { }, -- Current match in 'wildmenu' completion

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment        { fg = grey }, -- Any comment

    Constant       { fg = orange }, -- (*) Any constant
    Identifier     { fg = Normal.fg }, -- (*) Any variable name

    litteral       { fg = yellow },
    String         { litteral }, --   A string constant: "this is a string"
    Character      { litteral }, --   A character constant: 'c', '\n'
    
    value          { fg = purple },
    Number         { value }, --   A number constant: 234, 0xff
    Boolean        { value }, --   A boolean constant: TRUE, false
    Float          { value }, --   A floating point constant: 2.3e10

    Function       { fg = green }, --   Function name (also: methods for classes)

    Statement      { fg = red }, -- (*) Any statement
    -- Conditional    { }, --   if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    Operator       { Statement }, --   "sizeof", "+", "*", etc.
    -- Keyword        { }, --   any other keyword
    -- Exception      { }, --   try, catch, throw
    
    sym("@rust.keyword") { Statement },

    Label          { fg = purple }, --   case, default, etc.

    PreProc        { fg = red }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg = cyan }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    Special        { fg = red }, -- (*) Any special symbol
    SpecialChar    { Special }, --   Special character in a constant
    Tag            { fg = orange }, --   You can use CTRL-] on this
    Delimiter      { fg = Normal.fg }, --   Character that needs attention
    SpecialComment { Comment }, --   Special things inside a comment (e.g. '\n')
    Debug          { fg = yellow }, --   Debugging statements

    Underlined     { gui = "underline" , fg = purple}, -- Text that stands out, HTML links

    Ignore         { Comment }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          { fg = red }, -- Any erroneous construct
    Todo           { fg = orange.li(50) }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX


    GitSignsAdd { bg = cyan.da(60), fg = cyan }, -- Diff mode: Added line |diff.txt|
    GitSignsChange { bg = green.da(60), fg = green }, -- Diff mode: Changed line |diff.txt|
    GitSignsDelete { bg = red.da(60), fg = red }, -- Diff mode: Deleted line |diff.txt|

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError            { Error } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             { fg = yellow.sa(50) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { fg = cyan } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             { fg = blue.li(20) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    --
    NeogitGraphRed { fg = red },
    NeogitGraphGreen { fg = green },
    NeogitGraphBlue { fg = cyan },
    NeogitGraphYellow { fg = yellow },
    NeogitGraphPurple { fg = purple },
    NeogitGraphOrange { fg = orange }
  }
end)
-- Return our parsed theme for extension or use elsewhere.
return theme

