
* Check the Docker Version
```bash
        docker version
```

- note : if client and server are show then successfully done

* make a docker file for dockerize the image with container

```bash
        echo > Dockerfile
```

- note : no need to take any extension of this file

* Add Base Image like node python etc

```bash
                node:version
```

- the size of container is too big because it apply default linux flavour
- so we metion the flavour
* * alpine flavour provide consumable size to dockerize the image -[min 300mb].

```bash

        node:18-alpine3.12
```

# Copy the items in the container



```bash
        COPY source destination
```

- example -> 
*          COPY index.js /app/
- note if the /app/ directory is not present then it create also

to copy all all in the current folder then we use (.)
- you also say the destination as a working directory

example -> 

```bash
     COPY . /app/
```

- in the node js we have node_modules so we dont need to push the node_modules folder so we ignore the file 

```bash
        .dockerignore
```
- in this file we write name of files we dont need to push in image 

example 
```bash
node_modules/

```

# To navigate to working DIR 

```bash
            WORKDIR /folder
```

- we also define working directory at the top 
```bash

                node:18.16.1-alipne:3.12
                WORKDIR /app/
                COPY . .

```
- example https://hub.docker.com/_/node <!--- check the current node version -->

- in the copy . . 
- ```bash 
{
        - Copy is used to copy the data in the container image 
        - first . is represent the currenty dir source 
        -  {except dockerignore file data }
        - second . is represent WORKDIR destination
}```

# install node modules after copy in the destination
 
```bash
  RUN npm install
```
- after push the code it install the dependecies which are write in <sttong>package.json</strong>



### to start the development/production server after install the node_modules in image with the use of `CMD` and `ENTRYPOINT`
* with CMD
```bash
        cmd ['npm','run','dev'] #for development
        cmd ['npm','run','start'] # for production
```
* with ENTRYPOINT
```bash
        ENTRYPOINT ['npm','run','dev'] #for development
        ENTRYPOINT ['npm','run','start'] # for production
```

- the second way to write command
```bash
        cmd npm run dev         
```

* it create a new session , so that by it not recommanded

# Difference Between run and cmd command 
- in the image there are many command to build the docker image but the cmd command only one and at the last on the dockerfile
* `RUN` : It runs during build time, while creating an image
or running any other Docker commands like exec etc., but its output will be discarded as there won’
t exist anything on console or logs when you use this instruction inside Dockerfile.
* `CMD` : it run to start the server
once your application has been built successfully using CMD directive of Dockerfile. This means whenever our containers get started.

# build the image after creating the file
* go the root folder path
* open the ternimal of vs code/cmd


```bash

                docker build -t <image-name> <desitination of docker file >

```
- -t stand for tag image tag
- example docker build -t myapp . 
<!-- . because it in current file -->