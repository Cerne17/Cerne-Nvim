notation	meaning		    equivalent	decimal value(s)	 
-----------------------------------------------------------------------  
<Nul>		zero			CTRL-@	  0 (stored as 10) *<Nul>*
<BS>		backspace		CTRL-H	  8	*backspace*
<Tab>		tab			CTRL-I	  9	*tab* *Tab*
							*linefeed*
<NL>		linefeed		CTRL-J	 10 (used for <Nul>)
<CR>		carriage return		CTRL-M	 13	*carriage-return*
<Return>	same as <CR>				*<Return>*
<Enter>		same as <CR>				*<Enter>*
<Esc>		escape			CTRL-[	 27	*escape* *<Esc>*
<Space>		space				 32	*space*
<lt>		less-than		<	 60	*<lt>*
<Bslash>	backslash		\	 92	*backslash* *<Bslash>*
<Bar>		vertical bar		|	124	*<Bar>*
<Del>		delete				127
<CSI>		command sequence intro  ALT-Esc 155	*<CSI>*

<EOL>		end-of-line (can be <CR>, <NL> or <CR><NL>,
		depends on system and 'fileformat')	*<EOL>*
<Ignore>	cancel wait-for-character		*<Ignore>*
<NOP>		no-op: do nothing (useful in mappings)	*<Nop>*

<Up>		cursor-up			*cursor-up* *cursor_up*
<Down>		cursor-down			*cursor-down* *cursor_down*
<Left>		cursor-left			*cursor-left* *cursor_left*
<Right>		cursor-right			*cursor-right* *cursor_right*
<S-Up>		shift-cursor-up
<S-Down>	shift-cursor-down
<S-Left>	shift-cursor-left
<S-Right>	shift-cursor-right
<C-Left>	control-cursor-left
<C-Right>	control-cursor-right
<F1> - <F12>	function keys 1 to 12		*function_key* *function-key*
<S-F1> - <S-F12> shift-function keys 1 to 12	*<S-F1>*
<Help>		help key
<Undo>		undo key
<Insert>	insert key
<Home>		home				*home*
<End>		end				*end*
<PageUp>	page-up				*page_up* *page-up*
<PageDown>	page-down			*page_down* *page-down*
<kUp>		keypad cursor-up		*keypad-cursor-up*
<kDown>		keypad cursor-down		*keypad-cursor-down*
<kLeft>		keypad cursor-left		*keypad-cursor-left*
<kRight>	keypad cursor-right		*keypad-cursor-right*
<kHome>		keypad home (upper left)	*keypad-home*
<kEnd>		keypad end (lower left)		*keypad-end*
<kOrigin>	keypad origin (middle)		*keypad-origin*
<kPageUp>	keypad page-up (upper right)	*keypad-page-up*
<kPageDown>	keypad page-down (lower right)	*keypad-page-down*
<kDel>		keypad delete			*keypad-delete*
<kPlus>		keypad +			*keypad-plus*
<kMinus>	keypad -			*keypad-minus*
<kMultiply>	keypad *			*keypad-multiply*
<kDivide>	keypad /			*keypad-divide*
<kPoint>	keypad .			*keypad-point*
<kComma>	keypad ,			*keypad-comma*
<kEqual>	keypad =			*keypad-equal*
<kEnter>	keypad Enter			*keypad-enter*
<k0> - <k9>	keypad 0 to 9			*keypad-0* *keypad-9*
<S-…>		shift-key			*shift* *<S-*
<C-…>		control-key			*control* *ctrl* *<C-*
<M-…>		alt-key or meta-key		*META* *ALT* *<M-*
<A-…>		same as <M-…>			*<A-*
<T-…>		meta-key when it's not alt	*<T-*
<D-…>		command-key or "super" key	*<D-*
-----------------------------------------------------------------------  

Note:

- Availability of some keys (<Help>, <S-Right>, …) depends on the UI or host
  terminal.
- If numlock is on the |TUI| receives plain ASCII values, so mapping <k0>,
  <k1>, ..., <k9> and <kPoint> will not work.
- Nvim supports mapping multibyte chars with modifiers such as `<M-ä>`. Which
  combinations actually work depends on the UI or host terminal.
- When a key is pressed using a meta or alt modifier and no mapping exists for
  that keypress, Nvim may behave as though <Esc> was pressed before the key.
- It is possible to notate combined modifiers (e.g. <M-C-T> for CTRL-ALT-T),
  but your terminal must encode the input for that to work. |tui-input|

								*<>*
Examples are often given in the <> notation.  Sometimes this is just to make
clear what you need to type, but often it can be typed literally, e.g., with
the ":map" command.  The rules are:
 1.  Printable characters are typed directly, except backslash and "<"
 2.  Backslash is represented with "\\", double backslash, or "<Bslash>".
 3.  Literal "<" is represented with "\<" or "<lt>".  When there is no
     confusion possible, "<" can be used directly.
 4.  "<key>" means the special key typed (see the table above).  Examples:
	   <Esc>		Escape key
	   <C-G>		CTRL-G
	   <Up>			cursor up key
	   <C-LeftMouse>	Control- left mouse click
	   <S-F11>		Shifted function key 11
	   <M-a>		Meta- a  ('a' with bit 8 set)
	   <M-A>		Meta- A  ('A' with bit 8 set)

The <> notation uses <lt> to escape the special meaning of key names.  Using a
backslash also works, but only when 'cpoptions' does not include the 'B' flag.

Examples for mapping CTRL-H to the six characters "<Home>": >vim
	:imap <C-H> \<Home>
	:imap <C-H> <lt>Home>
The first one only works when the 'B' flag is not in 'cpoptions'.  The second
one always works.
To get a literal "<lt>" in a mapping: >vim
	:map <C-L> <lt>lt>

The notation can be used in a double quoted strings, using "\<" at the start,
e.g. "\<C-Space>".  This results in a special key code.  To convert this back
to readable text use `keytrans()`.

