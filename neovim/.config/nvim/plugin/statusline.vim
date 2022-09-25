function! GetDefaultSfdxOrg()
	return luaeval('require("sfdx").getDefaultUserName()')
endfunction

set statusline=%<%f\ %h%m%r%=%{GetDefaultSfdxOrg()}\ %-14.(%l,%c%V%)\ %P
