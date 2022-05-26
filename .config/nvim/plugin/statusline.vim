function! GetDefaultSfdxOrg()
	return luaeval('require("statusline").getDefaultSfdxOrg()')
endfunction

set statusline=%<%f\ %h%m%r%=%{GetDefaultSfdxOrg()}\ %-14.(%l,%c%V%)\ %P
