Repository for CS61A

## Setup enviroment  
First, make sure that docker installed:  
```bash
sudo apt update
sudo apt install docker 
```
From the repository directory, run these commands to create a Docker image and container:  
```bash
docker build . -t cs61a
docker create -it --name cs61a -v $(pwd):/cs61a cs61a bash
```
This will create a Docker image and container. To run it, type:  
```bash
docker start -a -i cs61a
```
to open a shell within the box. The Repository mounted at ```/cs61a``` and we are ready to go.
