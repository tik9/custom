
$folder="$home/bewerbung_doks"
$outputfile = "$home/app.pdf"

$arguments = $(Get-ChildItem $folder | Sort-Object name | ForEach-Object { $_.fullName }) -join ","

Invoke-Expression ("merge-pdf {0} -outputfile {1}" -f ($arguments, $outputfile))

Write-Output 'Argumente und Out ' $arguments, $outputfile