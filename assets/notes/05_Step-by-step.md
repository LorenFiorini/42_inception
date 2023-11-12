Sure, here is an imperative version of the text:

**Project Requirements**

1. Create a virtual machine (VM) and install the necessary tools.

2. Create a directory named `srcs` and place all project files within it.

3. Create a `Makefile` at the root of the project directory. This Makefile should build Docker images using `docker-compose.yml`.

4. Familiarize yourself with Docker concepts and documentation.

**Mandatory Tasks**

1. Set up a small infrastructure using Docker Compose.

2. Ensure each Docker image is named after its corresponding service.

3. Run each service in a separate container.

4. Build containers using either the penultimate stable version of Alpine or Debian.

5. Create Dockerfiles for each service, and reference them in `docker-compose.yml` via the Makefile.

6. Avoid using ready-made Docker images or services like DockerHub, except for Alpine/Debian.

7. Set up the following:

   a. A Docker container with NGINX using TLSv1.2 or TLSv1.3 only.

   b. A Docker container with WordPress + php-fpm (installed and configured) without NGINX.

   c. A Docker container with MariaDB only without NGINX.

   d. A volume for the WordPress database.

   e. A separate volume for WordPress website files.

   f. A Docker network for inter-container communication.

8. Implement container auto-restart upon crashes.

9. Avoid using hacky patches like `tail -f` to keep containers running. Understand how daemons work and their appropriateness.

10. Avoid using `network: host`, `--link`, or `links:`. Define the network in `docker-compose.yml`.

11. Avoid infinite loops in container startup commands, entrypoint scripts, or entrypoint itself. Examples include `tail -f`, `bash`, `sleep infinity`, and `while true`.

12. Research PID 1 and Dockerfile best practices.

13. Create two users in the WordPress database, one of which is an administrator. Avoid usernames like `admin/Admin`, `administrator/Administrator`, `admin`, `administrator`, `Administrator`, `admin-123`, and so on.

14. Mount volumes to the `/home/login/data` folder on the host machine. Replace `login` with your actual username.

15. Configure your domain name to point to your local IP address. Use the format `login.42.fr`, replacing `login` with your actual username. For example, `lfiorini.42.fr` should redirect to the IP address associated with your website.

16. Avoid using the latest tag for Docker images.

17. Avoid storing passwords in Dockerfiles.

18. Use environment variables instead of hardcoded values.

19. Strongly consider using a `.env` file to store environment variables. Place this file at the root of the `srcs` directory.

20. Make the NGINX container the sole entrypoint for your infrastructure, accessible only via port 443 and using TLSv1.2 or TLSv1.3.
