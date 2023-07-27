# cherif_worketyamo_docker_Bash-Scripting_Github_Terraform_Kubernetes_Ansible

## Build de l'image  cherif1/ansible_ssh

### le lien de l'image dans le docker hub est

[https://hub.docker.com/repository/docker/cherif1/ansible_ssh]

#### generer vos propres clés ssh à l'aide de la commande ssh-keygen

##### Pour builder l'image faite à partir de vos propres clés ssh

`sh docker pull cherif1/ansible_ssh`

`sh docker build --build-arg SSH_KEY_FILE=<value>`
