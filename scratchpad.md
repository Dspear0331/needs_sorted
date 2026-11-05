# Jenkins infastructure

## two catagories of agents 
### pernament agents
* decicated servers to running jenkins jobs
* java must be installed on server 
```bash 
#25 is the newest LTS openjdk can change per session or use 
#latest, but not recommend may not be a lts or stable openjdk  
sudo dnf install -y java-25-openjdk 
#ensure that the system is using the correct openjdk
sudo update-alternatives --config java
#chose the corrsponding number for openjdk
```
* jenkins ssh must also be setup
```bash 
ssh-keygen -t ed25519 ~/.ssh/<custom_key_pair_name> -C "jenkins"
ssh-copy-id -i ~/.ssh/<custom_key_pair_name.pub> user@host
```
* Note: the jenkins needs to have every dependices to run 

# Cloud Agents 
* ephemeral/dynamic agents spun up on demand 
 * dockers aws 

# Build Types
## Freestyle
* simplest method almost like .sh scripting
## pipelines
* writen in grovy to specify what happens in the build 
