
function build
{
  buildNewItem
  buildCopyItem
}
function buildNewItem
{
    New-Item -Path "$Env:ProgramFiles\WindowsPowerShell\Modules\$getModuleName" -ItemType Directory -Force  
}
function buildCopyItem
{
   Copy-Item -Recurse "$env:APPVEYOR_BUILD_FOLDER\*" "$Env:ProgramFiles\WindowsPowerShell\Modules\$getModuleName" -Force -Verbose
}