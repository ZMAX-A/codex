$ErrorActionPreference = 'Stop'

$stagedDiff = & git diff --cached --no-ext-diff --unified=0 -- .
if ($LASTEXITCODE -ne 0) {
    Write-Error 'Unable to inspect the staged diff.'
    exit 1
}

$patterns = @(
    '(?<![A-Za-z0-9])sk-[A-Za-z0-9_-]{16,}',
    '(?<![A-Za-z0-9])[a-f0-9]{20,}\.[A-Za-z0-9_-]{10,}',
    '(?<![A-Za-z0-9])AKIA[0-9A-Z]{16}(?![0-9A-Z])',
    '(?<![A-Za-z0-9])gh[pousr]_[A-Za-z0-9]{36,}',
    '-----BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY-----',
    '(?i)^git\s*:'
)

$currentFile = '<unknown>'
$flaggedFiles = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)

foreach ($line in $stagedDiff) {
    if ($line.StartsWith('+++ b/')) {
        $currentFile = $line.Substring(6)
        continue
    }

    if (-not $line.StartsWith('+') -or $line.StartsWith('+++')) {
        continue
    }

    $addedText = $line.Substring(1)
    foreach ($pattern in $patterns) {
        if ($addedText -match $pattern) {
            [void]$flaggedFiles.Add($currentFile)
            break
        }
    }
}

if ($flaggedFiles.Count -gt 0) {
    Write-Host 'Commit blocked: potential credential material was found in staged additions.' -ForegroundColor Red
    Write-Host 'Flagged files:' -ForegroundColor Yellow
    $flaggedFiles | Sort-Object | ForEach-Object { Write-Host "  - $_" }
    Write-Host 'Remove the secret, rotate it if exposed, then stage the cleaned file.' -ForegroundColor Yellow
    exit 1
}

exit 0
