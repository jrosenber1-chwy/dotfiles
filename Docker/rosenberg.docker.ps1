########################################
# Docker aliases
########################################

# docker container ls
function Use-DockerLs { & docker container ls $args } 
Set-Alias -Name dls -Value Use-DockerLs
function Use-DockerLsa { & docker container ls -a } 
Set-Alias -Name dlsa -Value Use-DockerLsa

# docker container rm
function Use-DockerRm { & docker container rm $args }
Set-Alias -Name drm -Value Use-DockerRm

# docker container logs
function Use-DockerContainerLogs { & docker container logs $args }
Set-Alias -Name dl -Value Use-DockerContainerLogs
function Use-DockerContainerLogsFollow { & docker container logs -f $args }
Set-Alias -Name dlf -Value Use-DockerContainerLogsFollow

# docker volume ls
function Use-DockerVolumeLs { & docker volume ls $args } 
Set-Alias -Name dvls -Value Use-DockerVolumeLs

########################################
# Docker environment variables
########################################

$Env:COMPOSE_HTTP_TIMEOUT=300