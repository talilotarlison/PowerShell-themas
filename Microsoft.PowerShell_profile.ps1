function prompt {
    return "$ "
}

function ls-l {
    (Get-ChildItem | Select-Object -ExpandProperty Name) -join "  "
}


$Host.UI.RawUI.ForegroundColor = "Green"
$Host.UI.RawUI.WindowTitle = "Terminal"


