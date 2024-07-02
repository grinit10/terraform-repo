param (
    [Parameter(Mandatory=$true)]
    [string]$Environment
)

$envDir = "environments\$Environment"
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

# Change to the environment directory
Set-Location -Path $envDir

# Initialize Terraform
terraform init

# Apply Terraform configuration
terraform apply -var-file="terraform.tfvars" -auto-approve

# Reset the location to the root of the repository
Set-Location -Path ../..
