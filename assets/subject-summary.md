
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
   - Configure to be accessible on the host at `/home/lfiorini/data`.

### **Network:**
- Create a Docker network to establish the connection between the containers.

### **Domain:**
- Configure the domain name `lfiorini.42.fr` to point to the local IP address.

### **Makefile:**
- Create a Makefile to set up the entire application (i.e., build the Docker images using docker-compose.yml).

### **Bonus:**
- Set up `redis cache` for the WordPress website.
- Set up a `FTP server` container pointing to the WordPress website volume.
- Create a simple static website in a language other than PHP.
- Set up Adminer.
- Set up a service of your choice.

## Usage