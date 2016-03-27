function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet('Chocolatey','NuGet','PowerShellGet')]
        [System.String]
        $ProviderName
    )

    
    $returnValue = @{
        ProviderName = ''
    }

    Write-Verbose "Checking for the $ProviderName PackageProvider."
    $PackageProvider = Get-PackageProvider -ListAvailable -Name $ProviderName

    if($PackageProvider)
    {
        Write-Verbose "The $ProviderName is present on the system."
        $returnValue.ProviderName = $ProviderName
    }
    else
    {
        Write-Verbose "The $ProviderName is absent from the system."
        $returnValue.ProviderName = 'NOT_INSTALLED'
    }
    
    $returnValue
  
}


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet('Chocolatey','NuGet','PowerShellGet')]
        [System.String]
        $ProviderName
    )
        
    Write-Verbose "Checking for the $ProviderName PackageProvider."
    $PackageProvider = Get-PackageProvider -ListAvailable -Name $ProviderName

    if(-not ($PackageProvider))
    {
        Write-Verbose "Installing $ProviderName on the system."
        Install-PackageProvider -Name $ProviderName -Force -ForceBootstrap -Scope AllUsers
        Import-PackageProvider  -Name $ProviderName -Force -ForceBootstrap
    }
}


function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet('Chocolatey','NuGet','PowerShellGet')]
        [System.String]
        $ProviderName
    )

    Write-Verbose "Checking for the $ProviderName PackageProvider."
    $PackageProvider = Get-PackageProvider -ListAvailable -Name $ProviderName

    if($PackageProvider) 
    { 
        Write-Verbose "The $ProviderName PackageProvider is installed on this system."
        return $true 
    }
    else 
    { 
        Write-Verbose "The $ProviderName PackageProvider is not installed on this system."
        return $false 
    }
}


Export-ModuleMember -Function *-TargetResource

