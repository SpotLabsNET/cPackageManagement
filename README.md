
[![Build status](https://ci.appveyor.com/api/projects/status/cbn2ugntt02msbrk/branch/master?svg=true&passingText=master%20-%20passing&failingText=master%20-%20failing&pendingText=building)](https://ci.appveyor.com/project/SpotLabsNET/cpackagemanagement/branch/master) [![Build status](https://ci.appveyor.com/api/projects/status/cbn2ugntt02msbrk/branch/develop?svg=true&passingText=develop%20-%20passing&failingText=develop%20-%20failing&pendingText=building)](https://ci.appveyor.com/project/SpotLabsNET/cpackagemanagement/branch/develop)


#cPackageManagement

The cPackageManagement module contains resources that target the configuration of the system package manager. The module provides resources representing PackageProvider, PackageSource and Package. This module is restricted to NuGet, PowerShellGet and Chocolatey to ensure a robust set of use cases. 

##Resources

* **cPackageProvider** – The cPackageProvider resource assists with bootstraping the NuGet, PowerShellGet and Chocolatey providers on the underlying system. For unknown reasons the PackageManagement libraries do not expose a method to remove a PackageProvider, only 'Install' and 'Import'. 

* **cPackageSource** – The cPackageSource resource assists with registering and unregistering package repositories on the underlying system. There is full support for NuGet, PowerShellGet and Chocolatey provider sematics to interact with the source repository. 

* **cPackage** - The cPackage resource is used to install, uninstall, publish and save packages supplied by a PackageSource using the semantics of the NuGet, PowerShellGet or Chocolatey PackageProviders.

##Requirements

This module has dependecies on the PackageManagement framework:

* [PowerShell 5.0](https://www.microsoft.com/en-us/download/details.aspx?id=50395)
* [PowerShell 4.0](https://www.microsoft.com/en-us/download/details.aspx?id=51451)
* [PowerShell 3.0](https://www.microsoft.com/en-us/download/details.aspx?id=51451)
