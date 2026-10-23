# Node.js Application Deployment with Docker and GitHub Actions

A hands-on DevOps project demonstrating how to containerize a Node.js application using Docker, manage the application with Docker Compose, and work toward automating the deployment workflow using GitHub Actions.

## Project Overview

The goal of this project is to learn how a Node.js application can be packaged into a Docker container and run in a consistent environment. It also explores how GitHub Actions can be used to automate tasks in a software delivery workflow.

## Tech Stack

- **Node.js** — Application runtime
- **Docker** — Containerization
- **Docker Compose** — Container configuration and management
- **Git and GitHub** — Version control and source code hosting
- **GitHub Actions** — Workflow automation

## Project Features

- Created a Dockerfile to build an image for the Node.js application.
- Used Docker Compose to configure and run the application container.
- Configured port mapping to access the application on port `8080`.
- Set a container restart policy.
- Added a GitHub Actions workflow as part of the CI/CD learning process.

## Project Structure

```text
Nodejs-application-deploy/
├── .github/
│   └── workflows/       # GitHub Actions workflows
├── Dockerfile            # Docker image configuration
├── docker-compose.yml    # Container configuration
├── index.js              # Node.js application entry point
├── package.json          # Application dependencies and scripts
├── package-lock.json     # Locked dependency versions
└── README.md             # Project documentation
```

## Prerequisites

Install the following tools:

- Node.js and npm
- Git
- Docker Engine or Docker Desktop
- Docker Compose

## Run the Project Locally

### 1. Clone the repository

```bash
git clone https://github.com/shreyashdaud-droid/Nodejs-application-deploy.git
cd Nodejs-application-deploy
```

### 2. Build and start the application

```bash
docker compose up --build -d
```

### 3. Check the running container

```bash
docker compose ps
docker compose logs -f app
```

### 4. Access the application

Open the following address in your browser:

```text
http://localhost:8080
```

This assumes the application starts successfully and listens on port `8080`.

### 5. Stop the application

```bash
docker compose down
```

## What I Learned

- How a Dockerfile defines the steps required to package an application.
- How Docker Compose simplifies container configuration and startup.
- How host-to-container port mapping makes an application accessible.
- How to inspect container status and application logs.
- How GitHub Actions can support automated software delivery workflows.

## Future Improvements

- Add automated build and test checks to the CI/CD pipeline.
- Publish versioned Docker images to a container registry.
- Deploy the container to an AWS EC2 instance.
- Add environment-specific configuration and secrets management.
- Improve container security and health monitoring.

## Author

**Shreyash Daud**

- GitHub: [shreyashdaud-droid](https://github.com/shreyashdaud-droid)
- Project Repository: [Nodejs-application-deploy](https://github.com/shreyashdaud-droid/Nodejs-application-deploy)
