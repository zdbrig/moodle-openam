# Moodle and OpenAM in Docker Compose

This project provides a Docker Compose configuration for running Moodle and OpenAM together. Moodle is an open-source learning management system, while OpenAM is an open-source access management solution. The Docker Compose configuration allows you to run both applications in separate containers and easily manage their deployment.

## Prerequisites

- Docker Engine
- Docker Compose

## Usage

1. Clone the repository to your local machine:
```
git clone https://github.com/example/moodle-openam-docker.git
```

2. Create a `.env` file in the project root directory with the necessary environment variables. See `.env.example` for an example configuration.

3. Customize the `moodle/config.php` and `openam/config` files with your desired configuration settings.

4. Initialize the database:
```
docker-compose run db mysql -h db -u moodle_user -p moodle_password < init_db.sql

```
5. Start the containers:
```
docker-compose up -d

```

6. Access Moodle at `http://localhost:8080` and OpenAM at `http://localhost:8081/openam`. Use the credentials set in the `.env` file.

## Notes

- The Moodle container uses the official Moodle image as a base and copies a custom `config.php` file and an initialization script to the container. The initialization script installs Moodle if it's not already installed and sets up the necessary permissions and directories.
- The OpenAM container uses the official ForgeRock OpenAM image as a base and copies a custom `config` directory and an initialization script to the container. The initialization script configures OpenAM if it's not already configured and sets up additional configuration or realms if needed.
- The database container uses the official MySQL or PostgreSQL image as a base and initializes the database using the `init_db.sql` script.
- You can customize the Docker Compose configuration as needed, such as changing the port numbers or adding additional services.
- This is a basic example configuration and may not be suitable for production use. Make sure to secure your environment and follow best practices for running Docker containers in production.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

