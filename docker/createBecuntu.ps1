$hostOrgs = sf org list --json
$orgJson = $hostOrgs | Out-String | ConvertFrom-Json

foreach ($org in $orgJson.result.sandboxes) {
    write-host "$($org.alias)"
    # sf org display --target-org "$org.alias" --verbose --json > "$org.alias".json
}