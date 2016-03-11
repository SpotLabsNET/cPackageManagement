
[![Build status](https://ci.appveyor.com/api/projects/status/cbn2ugntt02msbrk/branch/master?svg=true&passingText=master%20-%20passing&failingText=master%20-%20failing&pendingText=building)](https://ci.appveyor.com/project/SpotLabsNET/cpackagemanagement/branch/master) [![Build status](https://ci.appveyor.com/api/projects/status/cbn2ugntt02msbrk/branch/develop?svg=true&passingText=develop%20-%20passing&failingText=develop%20-%20failing&pendingText=building)](https://ci.appveyor.com/project/SpotLabsNET/cpackagemanagement/branch/develop)


# cPackageManagement

The cPackageManagement module contains resources that target the configuration of the system package manager. The modules provides resources that target the configuration of PackageProviders, PackageSources and Packages. This module is restricted to NuGet, PowerShellGet and Chocolatey to ensure a robust set of use cases. 

## Resources

* **cPackageProvider** – The cPackageProvider resource assist in the bootstraping of package providers to the underlying system. This includes NuGet, PowerShellGet and Chocolatey. For unknown reasons the PackageManagement libraries do not expose a method to remove a PackageProvider, only 'Install' and 'Import'. 

* **cPackageSource** – The cPackageSource resource assists with registering and unregistering package repositories on the underlying system. There is full support for NuGet, PowerShellGet and Chocolatey provider sematics to interop with the source repository. 

* **cPackage** - The cPackage resource is used to install, uninstall, publish and save packages supplied by a PackageSource using the semantics of a NuGet, PowerShellGet or Chocolatey providers.


## Contributing
Please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).

**NugetPackage** DSC resource has the following properties:
<table>
    <tr>
        <td> <b>Property</b> </td>
        <td><b>Description</b> </td>
    </tr>
    <tr>
        <td>Name</td>
        <td>Specifies the name of the package to be installed or uninstalled.</td>
    </tr>
    <tr>
    <td>DestinationPath</td>
    <td>Specifies a file location where you want the package to be installed.</td>
    </tr>
    <tr>
    <td>Ensure</td>
    <td>Determines whether the package is to be installed or uninstalled.</td>
    </tr>
    <tr>
    <td>InstallationPolicy</td>
    <td>Determines whether you trust the package's source.</td>
    </tr>
    <tr>
    <td>RequiredVersion</td>
    <td>Specifies the exact version of the package you want to install or uninstall.</td>
    </tr>
    <tr>
    <td>MinimumVersion</td>
    <td>Specifies the minimum version of the package you want to install or uninstall.</td>
    </tr>
    <tr>
    <td>MaximumVersion</td>
    <td>Specifies the maximum version of the package you want to install or uninstall.</td>
    </tr>
    <tr>
    <td>Source</td>
    <td>Specifies the URI or name of the registered package source.</td>
    </tr>
    <tr>
    <td>SourceCredential</td>
    <td>Provides access to the package on a remote source. This property is not used to install the package. The package is always installed on the local system account.</td>
    </tr>
</table>

**PSModule** DSC resource has the following properties:

<table>
    <tr>
        <td><b>Property</b></td>
        <td><b>Description</b></td>
    </tr>
    <tr>
        <td>Name</td>
        <td>Specifies the name of the PowerShell module to be installed or uninstalled.</td>
    </tr>
    <tr>
    <td>Ensure</td>
    <td>Determines whether the module to be installed or uninstalled.</td>
    </tr>
    <tr>
    <td>InstallationPolicy</td>
    <td>Determines whether you trust the source repository where the module resides.</td>
    </tr>
    <tr>
    <td>RequiredVersion</td>
    <td>Specifies the exact version of the module you want to install or uninstall.</td>
    </tr>
    <tr>
    <td>MinimumVersion</td>
    <td>Specifies the minimum version of the module you want to install or uninstall.</td>
    </tr>
    <tr>
    <td>Repository</td>
    <td>Specifies the name of the module source repository where the module can found.</td>
    </tr>
</table>

**PackageManagementSource** has the following properties:

<table>
    <tr>
        <td><b>Property</b></td>
        <td><b>Description</b></td>
    </tr>
    <tr>
        <td>Name</td>
        <td>Specifies the name of the package source to be registered or unregistered on your system.</td>
    </tr>
    <tr>
      <td>ProviderName</td>
      <td>Specifies the name of the OneGet provider through which you can interop with the package source.</td>
    </tr>
    <tr>
    <td>Ensure</td>
    <td>Determines whether the package source is to be registered or unregistered.</td>
    </tr>
    <tr>
    <td>InstallationPolicy</td>
    <td>Determines whether you trust the package source.</td>
    </tr>
    <tr>
    <td>SourceUri</td>
    <td>Specifies the URI of the package source.</td>
    </tr>
    <tr>
    <td>SourceCredential</td>
    <td>Provides access to the package on a remote source.</td>
    </tr>
</table>
<br/>
####**Requirements**####

Before you install this package, you must be running  [Windows Management Framework 5.0 Product Preview](https://www.microsoft.com/en-us/download/details.aspx?id=48729).

<br/>
####**Installation**####

To use the **cPackageManagement** module,
* Copy the content of the download to the $env:ProgramFiles\WindowsPowerShell\Modules folder.

To confirm installation,
* Run **Get-DSCResource** to verify that NugetPackage, OneGetSource, PSModule are among the DSC Resources are listed in your DSC resources.

<br/>
####**Building the Code**####

The code is a Windows PowerShell script and interpreted by the Windows PowerShell engine at runtime.

<br/>
####**Running Test**####

To test the modules, run the following commands. The NuGetPackage resource is used here as an example.
* cd $env:ProgramFiles\WindowsPowerShell\Modules\cPackageManagement\Test
* .\NugetPackage\NugetPackage.Get.Tests.ps1
* .\NugetPackage\NugetPackage.Set.Tests.ps1
* .\NugetPackage\NugetPackage.Test.Tests.ps1

You can repeat these commands similarly for testing PSModule and OneGetSource DSC resources.

<br/>
####**Contributing to the Code**####

You are welcome to contribute to this project. There are many ways to contribute:

1.	Submit a bug report via [Issues]( https://github.com/PowerShell/cPackageManagement/issues). For a guide to submitting good bug reports, please read [Painless Bug Tracking](http://www.joelonsoftware.com/articles/fog0000000029.html).

2.	Verify fixes for bugs.

3.	Submit your fixes for a bug. Before submitting, please make sure you have:
 - Performed code reviews of your own
 - Updated the test cases if needed
 - Run the test cases to ensure no feature breaks or test breaks
 - Added the test cases for new code
4.	Submit a feature request.
5.	Help answer questions in the discussions list.
6.	Submit test cases.
7.	Tell others about the project.
8.	Tell the developers how much you appreciate the product!

You might also read these two blog posts about contributing code: [Open Source Contribution Etiquette](http://tirania.org/blog/archive/2010/Dec-31.html) by Miguel de Icaza, and [Don’t “Push” Your Pull Requests](http://www.igvita.com/2011/12/19/dont-push-your-pull-requests/) by Ilya Grigorik.

Before submitting a feature or substantial code contribution, please discuss it with the Windows PowerShell team via [Issues]( https://github.com/WindowsPowerShell/OneGetResource/issues), and ensure it follows the product roadmap. Note that all code submissions will be rigorously reviewed by the Windows PowerShell Team. Only those that meet a high bar for both quality and roadmap fit will be merged into the source.

####**Examples**####

Samples are included in the Examples folder.
