Invoke-Expression (&starship init powershell)

Import-Module posh-git

Set-PSReadLineKeyHandler -Chord Ctrl+n HistorySearchForward
Set-PSReadLineKeyHandler -Chord Ctrl+p HistorySearchBackward

New-Alias l ls

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
. C:\Users\Y2DX\AppData\Local\sf\autocomplete\functions\powershell\sf.ps1
