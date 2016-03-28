
function deploy
{
          # Creating project artifact
      $stagingDirectory = (Resolve-Path ..).Path
      $manifest = Join-Path $pwd "cPackageManagement.psd1"
      (Get-Content $manifest -Raw).Replace("1.8.0.0", $env:APPVEYOR_BUILD_VERSION) | Out-File $manifest
      $zipFilePath = Join-Path $stagingDirectory "$(Split-Path $pwd -Leaf).zip"
      Add-Type -assemblyname System.IO.Compression.FileSystem
      [System.IO.Compression.ZipFile]::CreateFromDirectory($pwd, $zipFilePath)

      # Creating NuGet package artifact
      New-Nuspec -packageName $env:APPVEYOR_PROJECT_NAME -version $env:APPVEYOR_BUILD_VERSION -author $manifest.Author -owners $manifest.CompanyName -licenseUrl $manifest.PrivateData.LicenseUrl -projectUrl $manifest.PrivateData.ProjectUrl -packageDescription $env:APPVEYOR_PROJECT_NAME -tags $manifest.PrivateData.Tags -destinationPath .
      nuget pack ".\$($env:APPVEYOR_PROJECT_NAME).nuspec" -outputdirectory .
      $nuGetPackageName = $env:APPVEYOR_PROJECT_NAME + "." + $env:APPVEYOR_BUILD_VERSION + ".nupkg"
      $nuGetPackagePath = (Get-ChildItem $nuGetPackageName).FullName

      @(
          # You can add other artifacts here
          $zipFilePath,
          $nuGetPackagePath
      ) | % {
          Write-Host "Pushing package $_ as Appveyor artifact"
          Push-AppveyorArtifact $_
        }
}
