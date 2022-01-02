# Number of groups to support
$groupCount = 3 
$path = "X:\spreadshirtshirts\new"
$files = Get-ChildItem $path -File 

For($fileIndex = 0; $fileIndex -lt $files.Count; $fileIndex++){
    $targetIndex = $fileIndex % $groupCount
    $targetPath = Join-Path $path $targetIndex
    If(!(Test-Path $targetPath -PathType Container)){[void](new-item -Path $path -name $targetIndex -Type Directory)}
    $files[$fileIndex] | Move-Item -Destination $targetPath -Force
}
