$startfolder = ""

$output = ""

$colItems = (Get-ChildItem $startfolder | Where-Object {$_.PSIsContainer -eq $True} | Sort-Object)

$obj = @()

foreach ($i in $colItems)
    {
        $subFolderItems = (Get-ChildItem $i.FullName -Recurse -File | Measure-Object -property length -sum)
        $folderSize = ($subFolderItems.sum / 1MB) 
        $folderLocation = $i.Name
        
        foreach($string in $folderSize)
            {
                $obj += New-Object -TypeName psobject -Property @{Size="$folderSize"; Folder="$folderLocation"}
            }
    }

echo $obj | Export-CSV $output -NoTypeInformation