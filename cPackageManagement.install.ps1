
function install
{
    installPester
    installTester
    installHelper
}
function installPester
{
    Install-Package -Force -Name Pester
}
function intallTester
{
    git clone https://github.com/PowerShell/DscResource.Tests DSCResources.Tests.Shared
}
function installHelper
{
    $helperFile = ('src\SpotLabs.VisualShell.Tools\DSCResources.Tests.Shared\TestHelper.psm1')
    Import-Module $helperFile -Force

}