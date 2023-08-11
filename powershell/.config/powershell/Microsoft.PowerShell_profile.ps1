Invoke-Expression (&starship init powershell)

Import-Module posh-git

Set-PSReadLineKeyHandler -Chord Ctrl+n HistorySearchForward
Set-PSReadLineKeyHandler -Chord Ctrl+p HistorySearchBackward

New-Alias l ls
