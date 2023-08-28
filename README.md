-This project consists in setuping a small infrastructure composed of different
services under specific rules. It has to be done in a virtual machine. With the use of docker compose.

# Wath is Docker ?
- Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly.
- A little informations about Docker :
  
  Docker was developed for an internal project of dotCloud , a French company offering a platform as a service .Docker is distributed as an open source project from March 2013.
  It is currently the most used containerization engine .
# Docker objects 
- When you use Docker, you are creating and using images, containers, networks, volumes, plugins, and other objects.

# Images 
- An image is a read-only template with instructions for creating a Docker container.
- You might create your own images or you might only use those created by others and published in a registry.
- To build your own image, you create a Dockerfile with a simple syntax for defining the steps needed to create the image and run it.
- Each instruction in a Dockerfile creates a layer in the image. When you change the Dockerfile and rebuild the image, only those layers which have changed are rebuilt.
- This is part of what makes images so lightweight, small, and fast, when compared to other virtualization technologies.

# Containers 

- A container is a runnable instance of an image. You can create, start, stop, move, or delete a container using the Docker API or CLI. You can connect a container to one or more networks, attach storage to it, or even create a new image based on its current state.
- By default, a container is relatively well isolated from other containers and its host machine.
- A container is defined by its image as well as any configuration options you provide to it when you create or start it. When a container is removed, any changes to its state that aren't stored in persistent storage disappear.

# Docker Compose

- Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application's services. Then, with a single command, you create and start all the services from your configuration.

# The requirements of this project Inception

- A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
  
- A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.
- A Docker container that contains MariaDB only without nginx.
- A volume that contains your WordPress database.
- A second volume that contains your WordPress website files.
- A docker-network that establishes the connection between your containers
