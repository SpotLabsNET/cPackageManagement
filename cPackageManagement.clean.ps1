
function purgeDirectory([ValidateScript({Test-Path -Path $_})][Parameter(Mandatory)]$Path)
{
	Remove-Item -Path $Path -Recurse -Force -ErrorAction Ignore
}

purgeDirectory $PSScriptRoot\obj
purgeDirectory $PSScriptRoot\bin
purgeDirectory $PSScriptRoot\DSCResources.Tests.Shared
purgeDirectory $PSScriptRoot\DSCResources.Tests\.tmp