
# Summary

## Requirements

### **Docker Containers:**
1. **NGINX (with TLSv1.2 or TLSv1.3):**
     - Create a Dockerfile for NGINX.
     - Configure NGINX to use only TLSv1.2 or TLSv1.3.
     - Ensure the container restarts in case of a crash.
   
2. **WordPress + php-fpm (without nginx):**
     - Create a Dockerfile for WordPress with php-fpm.
     - Configure and install php-fpm within the container.
     - Ensure the container restarts in case of a crash.
   
3. **MariaDB (without nginx):**
     - Create a Dockerfile for MariaDB.
     - Ensure the container restarts in case of a crash.
   
### **Volumes:**
1. **WordPress database**
   - Configure to be accessible on the host at `/home/lfiorini/data`.
   - Create two users, one being an administrator.
     - The administrator’s username can’t contain admin/Admin or administrator/Administrator (e.g., admin, administrator, Administrator, admin-123, and so forth).
2. **WordPress website files**
   - Configure the volume to be accessible on the host at `/home/login/data`.
  1. WordPress **database**.
  - In your WordPress database, there must be two users, one of them being the administrator. The administrator’s username can’t contain admin/Admin or administrator/Administrator (e.g., admin, administrator, Administrator, admin-123, and so forth).
  2. WordPress **website files**.
- A **docker network** that establishes the connection between your containers.

  - Your volumes will be available in the /home/login/data folder of the host machine using Docker. Of course, you have to replace the login with yours.

### **Security and Environment Variables:**
1. **Security**
   - Implement security best practices for Docker containers.
2. **Environment Variables**
   - Use environment variables in your Dockerfiles.
   - Store your environment variables in a `.env` file located in the `srcs` directory.
   - 






- [ ]  You have to configure your domain name so it points to your local IP address.
- [ ]  This domain name must be [`lfiorini.42.fr`](http://lfiorini.42.fr/).
- [ ]  It is mandatory to use environment variables.
- [ ]  It is strongly recommended to use a `.env` file to store environment variables. The `.env` file should be located at the root of the **srcs** directory.
- [ ]  Your NGINX container must be the only entrypoint into your infrastructure via the **port 443** only, using the TLSv1.2 or TLSv1.3 protocol.

To fulfill the requirements outlined in the project, you'll need to follow these steps:

### Mandatory Part:

1. **NGINX Container with TLSv1.2 or TLSv1.3:**
   - Create a Dockerfile for NGINX.
   - Configure NGINX to use only TLSv1.2 or TLSv1.3.
   - Ensure the container restarts in case of a crash.
   
2. **WordPress + php-fpm Container:**
   - Create a Dockerfile for WordPress with php-fpm.
   - Configure and install php-fpm within the container.
   - Ensure the container restarts in case of a crash.
   
3. **MariaDB Container:**
   - Create a Dockerfile for MariaDB.
   - Ensure the container restarts in case of a crash.
   
4. **Volumes:**
   - Set up a volume for WordPress database.
   - Set up a second volume for WordPress website files.
   - Configure the volumes to be accessible on the host at `/home/login/data`.

5. **Docker Network:**
   - Establish a Docker network that connects all the containers.

6. **User Configuration in WordPress Database:**
   - In the WordPress database, create two users, one being an administrator.
   - Ensure the administrator's username does not contain admin/Admin or administrator/Administrator.

7. **Domain Configuration:**
   - Configure your domain name, `login.42.fr`, to point to your local IP address.

8. **Security and Environment Variables:**
   - Implement security best practices for Docker containers.
   - Use environment variables in Dockerfiles.
   - Store environment variables in a `.env` file (located in the `srcs` directory).

9. **NGINX as the Entry Point:**
   - Configure NGINX as the only entry point to the infrastructure.
   - Allow access only through port 443 using TLSv1.2 or TLSv1.3.
