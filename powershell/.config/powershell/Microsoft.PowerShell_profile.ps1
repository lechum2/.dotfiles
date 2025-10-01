Invoke-Expression (& { (zoxide init powershell | Out-String) })

Set-PSReadLineKeyHandler -Chord Ctrl+n HistorySearchForward
Set-PSReadLineKeyHandler -Chord Ctrl+p HistorySearchBackward

New-Alias l ls
New-Alias jq jq-windows-amd64.exe
New-Alias make mingw32-make.exe

function Update-Apex-Lsp {
    $location_command = 'nvim --headless +"lua print(vim.fn.stdpath(\"data\"))" +qa'
    $location = cmd /c $location_command '2>&1'
    Invoke-WebRequest 'https://raw.githubusercontent.com/forcedotcom/salesforcedx-vscode/develop/packages/salesforcedx-vscode-apex/jars/apex-jorje-lsp.jar' -OutFile "$location\apex-jorje-lsp.jar"
}

. C:\Users\X9T\AppData\Local\sf\autocomplete\functions\powershell\sf.ps1

# WezTerm integration when using starship
$prompt = ""
function Invoke-Starship-PreCommand {
    $current_location = $executionContext.SessionState.Path.CurrentLocation
    if ($current_location.Provider.Name -eq "FileSystem") {
        $ansi_escape = [char]27
        $provider_path = $current_location.ProviderPath -replace "\\", "/"
        $prompt = "$ansi_escape]7;file://${env:COMPUTERNAME}/${provider_path}$ansi_escape\"
    }
    $host.ui.Write($prompt)
}
Invoke-Expression (&starship init powershell)

Import-Module posh-git
