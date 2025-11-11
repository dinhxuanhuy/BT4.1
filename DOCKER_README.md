# Murach Survey Application - Docker Deployment Guide

## 📦 Prerequisites

- Docker Desktop installed
- Docker Compose installed

## 🚀 Quick Start

### 1. Build and Run with Docker Compose (Recommended)

```bash
# Build and start the application
docker-compose up --build

# Run in detached mode (background)
docker-compose up -d --build

# Stop the application
docker-compose down
```

### 2. Build and Run with Docker Commands

```bash
# Build the Docker image
docker build -t murach-survey-app .

# Run the container
docker run -d -p 8080:8080 --name murach-survey murach-survey-app

# Stop the container
docker stop murach-survey

# Remove the container
docker rm murach-survey
```

## 🌐 Access the Application

Once the container is running, access the application at:
- **URL**: http://localhost:8080
- **Survey Form**: http://localhost:8080/index.html

## 🔍 Useful Docker Commands

```bash
# View running containers
docker ps

# View container logs
docker logs murach-survey-webapp

# View logs in real-time
docker logs -f murach-survey-webapp

# Access container shell
docker exec -it murach-survey-webapp bash

# View Docker images
docker images

# Remove Docker image
docker rmi murach-survey-app

# Stop all containers
docker stop $(docker ps -aq)

# Remove all stopped containers
docker prune
```

## 📊 Container Details

- **Base Image**: Tomcat 9.0 with OpenJDK 11
- **Port**: 8080
- **Memory**: 512MB - 1GB (configurable)
- **Health Check**: Enabled (checks every 30s)

## 🔧 Configuration

### Change Port

Edit `docker-compose.yml`:
```yaml
ports:
  - "9090:8080"  # Change 9090 to your desired port
```

### Adjust Memory

Edit `docker-compose.yml`:
```yaml
environment:
  - JAVA_OPTS=-Xms256m -Xmx512m  # Adjust memory limits
```

## 🚢 Deploy to Cloud Platforms

### Deploy to Docker Hub

```bash
# Login to Docker Hub
docker login

# Tag the image
docker tag murach-survey-app yourusername/murach-survey-app:latest

# Push to Docker Hub
docker push yourusername/murach-survey-app:latest
```

### Deploy to AWS ECS

1. Push image to Amazon ECR
2. Create ECS Task Definition
3. Create ECS Service
4. Configure Load Balancer

### Deploy to Google Cloud Run

```bash
# Build and push to Google Container Registry
gcloud builds submit --tag gcr.io/PROJECT_ID/murach-survey-app

# Deploy to Cloud Run
gcloud run deploy murach-survey-app \
  --image gcr.io/PROJECT_ID/murach-survey-app \
  --platform managed \
  --port 8080 \
  --allow-unauthenticated
```

### Deploy to Azure Container Instances

```bash
# Create resource group
az group create --name murach-rg --location eastus

# Create container instance
az container create \
  --resource-group murach-rg \
  --name murach-survey-app \
  --image murach-survey-app \
  --dns-name-label murach-survey \
  --ports 8080
```

### Deploy to Heroku

```bash
# Login to Heroku
heroku login
heroku container:login

# Create Heroku app
heroku create murach-survey-app

# Push Docker image
heroku container:push web -a murach-survey-app

# Release the app
heroku container:release web -a murach-survey-app

# Open the app
heroku open -a murach-survey-app
```

## 🐛 Troubleshooting

### Container won't start
```bash
# Check logs
docker logs murach-survey-webapp

# Check if port is already in use
netstat -ano | findstr :8080
```

### Application not accessible
- Ensure Docker Desktop is running
- Check if container is running: `docker ps`
- Verify port mapping: `docker port murach-survey-webapp`
- Try accessing: http://localhost:8080

### Build fails
```bash
# Clean Maven cache
docker-compose down
docker system prune -a
docker-compose up --build
```

## 📝 Notes

- The application uses multi-stage Docker build for optimization
- WAR file is deployed as ROOT.war for root context access
- Health checks ensure container stability
- Logs are available via `docker logs` command

## 📧 Support

For issues or questions, please check the application logs or container status.

