Project Structure
Plaintext
.
├── .github/
│   └── workflows/
│       └── deploy.yml          # GitHub Actions CI/CD pipeline definition
├── .dockerignore               # Files excluded from the Docker build context
├── Dockerfile                  # Multi-stage/lightweight Node.js alpine image
├── docker-compose.yml          # Container service and port mappings
├── index.js                    # Express server entry point
├── package.json                # Dependencies and start scripts
└── README.md
Prerequisites
Local Machine: Node.js (v18+), Docker Desktop, Git.

Cloud Infrastructure: AWS EC2 Instance running Ubuntu 22.04 / 24.04 LTS.

AWS Security Group Configuration:

Inbound: TCP Port 8080 from 0.0.0.0/0 (for public web traffic).

Inbound: TCP Port 22 restricted to Your Public IP (for initial SSH setup).

Outbound: HTTPS Port 443 to 0.0.0.0/0 (for runner polling).

Local Development Setup
Clone the repository:

Bash
git clone https://github.com/<your-username>/Nodejs-application-deploy.git
cd Nodejs-application-deploy
Install dependencies:

Bash
npm install
Run locally using Docker Compose:

Bash
docker compose up --build
Verify running application:

Bash
curl http://localhost:8080
Expected response:

JSON
{"status":"success","message":"CI/CD Pipeline Running!"}
EC2 Server Setup & Self-Hosted Runner Configuration
1. Install Docker on EC2
SSH into your AWS Ubuntu instance and execute:

Bash
sudo apt update
sudo apt install -y docker.io docker-compose-v2
sudo usermod -aG docker ubuntu
newgrp docker
Verify that Docker runs without sudo:

Bash
docker ps
2. Install and Register the GitHub Self-Hosted Runner
In your GitHub repository, navigate to Settings → Actions → Runners → New self-hosted runner.

Select Linux (x64) and execute the generated installation commands on your EC2 instance:

Bash
# Create directory and download package
mkdir actions-runner && cd actions-runner
curl -o actions-runner-linux-x64-2.319.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.319.1/actions-runner-linux-x64-2.319.1.tar.gz
tar xzf ./actions-runner-linux-x64-2.319.1.tar.gz

# Configure runner with your repository token
./config.sh --url https://github.com/<your-username>/Nodejs-application-deploy --token <YOUR_RUNNER_TOKEN>
Accept default selections for runner group, name, and work folder.

3. Run the GitHub Runner as a Systemd Service
To keep the runner active continuously in the background after closing your SSH session:

Bash
sudo ./svc.sh install ubuntu
sudo ./svc.sh start
sudo ./svc.sh status
CI/CD Pipeline Workflow
The pipeline configuration in .github/workflows/deploy.yml triggers on every push to the main branch:

YAML
name: Deploy Node.js App to EC2

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: self-hosted

    steps:
      - name: Checkout Code
        uses: actions/checkout@v4

      - name: Build and Deploy Container
        run: |
          docker compose up -d --build --remove-orphans

      - name: Clean Up Dangling Images
        run: |
          docker image prune -f
Deployment Verification
Make a change in index.js (e.g., bump version message).

Commit and push to GitHub:

Bash
git add index.js
git commit -m "feat: release updated API message"
git push origin main
Check the Actions tab on GitHub to verify the workflow execution.

Verify the updated deployment in your browser:

Bash
curl http://<YOUR_EC2_PUBLIC_IP>:8080
