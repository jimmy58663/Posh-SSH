[cmdletbinding()]
Param()
if (Get-Module -ListAvailable -Name platyPS) {
    Write-Verbose "platyPS is installed."
    Import-Module platyPS
}
else {
    Write-Error "Module platyPS is not installed. Can not generate docs"
    exit
}

Write-Verbose "Turning markdown documents to External Help files"
New-ExternalHelp .\docs -OutputPath .\Release\en-US -Force -verbose
Write-Verbose "Updates markdown files"
Write-Verbose "Importing release version of module."
Import-Module .\Release\Posh-SSH.psd1 -verbose -Force
Write-Verbose "Updating Markdown"
New-MarkdownHelp -Module Posh-ssh -Force -OutputFolder .\docs
