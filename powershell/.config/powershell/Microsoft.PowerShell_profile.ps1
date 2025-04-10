Invoke-Expression (& { (zoxide init powershell | Out-String) })

Set-PSReadLineKeyHandler -Chord Ctrl+n HistorySearchForward
Set-PSReadLineKeyHandler -Chord Ctrl+p HistorySearchBackward

New-Alias l ls
New-Alias jq jq-windows-amd64.exe
New-Alias make mingw32-make.exe

function Update-Apex-Lsp {
    $location_command = 'nvim --headless +"lua print(vim.fn.stdpath(\"data\"))" +qa'
    $location = cmd /c $location_command '2>&1'
    Invoke-WebRequest 'https://github.com/forcedotcom/salesforcedx-vscode/blob/develop/packages/salesforcedx-vscode-apex/out/apex-jorje-lsp.jar?raw=true' -OutFile "$location\apex-jorje-lsp.jar"
}

. C:\Users\X9T\AppData\Local\sf\autocomplete\functions\powershell\sf.ps1

Invoke-Expression (&starship init powershell)

Set-Location C:\Users\X9T\workspace
