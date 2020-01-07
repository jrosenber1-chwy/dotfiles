########################################
# Maven aliases
########################################

# mvn clean install
function Use-MvnCleanInstallSkipTests { & mvn clean install -DskipTests -DskipIntegrationTests }
Set-Alias -Name mci -Value Use-MvnCleanInstallSkipTests
function Use-MvnCleanInstall { & mvn clean install }
Set-Alias -Name mcit -Value Use-MvnCleanInstall

# mvn clean package
function Use-MvnCleanPackageSkipTests { & mvn clean package -DskipTests -DskipIntegrationTests }
Set-Alias -Name mcp -Value Use-MvnCleanPackageSkipTests