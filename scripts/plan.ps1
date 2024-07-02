param (
    [Parameter(Mandatory=$true)]
    [string]$Environment,
    [Parameter(Mandatory=$true)]
    [string]$ProjectName
)

$envDir = "$ProjectName\environments\$Environment"
$commonSourceDir = "$ProjectName\common"
$commonDestDir = "$envDir\common"
$modulesSourceDir = "modules"
$modulesDestDir = "$envDir\modules"

# Check if the environment directory exists
if (-Not (Test-Path -Path $envDir)) {
    Write-Error "Environment directory '$envDir' does not exist."
    exit 1
}

# Remove the existing modules directory if it exists
if (Test-Path -Path $modulesDestDir) {
    Remove-Item -Recurse -Force -Path $modulesDestDir
}

# Copy the modules directory to the environment directory
Copy-Item -Recurse -Path $modulesSourceDir -Destination $modulesDestDir
Copy-Item -Recurse -Path $commonSourceDir -Destination $commonDestDir

# Change to the environment directory
Set-Location -Path $envDir

# Initialize Terraform
terraform init

# Plan Terraform configuration
terraform plan -var-file="terraform.tfvars"

# Reset the location to the root of the repository
Set-Location -Path ../../..

#cleanup copied directories
Remove-Item -Recurse -Force -Path $commonDestDir
Remove-Item -Recurse -Force -Path $modulesDestDir