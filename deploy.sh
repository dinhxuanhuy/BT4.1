git remote add origin https://github.com/dinhxuanhuy/BT4.1.git#!/bin/bash

# Murach Survey App - Docker Deployment Script
echo "========================================="
echo "  Murach Survey App - Docker Deployment"
echo "========================================="
echo ""

# Function to display menu
show_menu() {
    echo "Select an option:"
    echo "1. Build and Run (Docker Compose)"
    echo "2. Build Only"
    echo "3. Run Only"
    echo "4. Stop Application"
    echo "5. View Logs"
    echo "6. Remove Containers and Images"
    echo "7. Deploy to Docker Hub"
    echo "8. Exit"
    echo ""
}

# Function to build and run
build_and_run() {
    echo "Building and starting application..."
    docker-compose up --build -d
    echo ""
    echo "Application is starting..."
    echo "Access at: http://localhost:8080"
    echo ""
}

# Function to build only
build_only() {
    echo "Building Docker image..."
    docker build -t murach-survey-app .
    echo ""
    echo "Build complete!"
}

# Function to run only
run_only() {
    echo "Starting application..."
    docker run -d -p 8080:8080 --name murach-survey murach-survey-app
    echo ""
    echo "Application started!"
    echo "Access at: http://localhost:8080"
}

# Function to stop
stop_app() {
    echo "Stopping application..."
    docker-compose down
    echo ""
    echo "Application stopped!"
}

# Function to view logs
view_logs() {
    echo "Fetching logs..."
    docker-compose logs -f
}

# Function to clean up
cleanup() {
    echo "Removing containers and images..."
    docker-compose down
    docker rmi murach-survey-app
    docker system prune -f
    echo ""
    echo "Cleanup complete!"
}

# Function to deploy to Docker Hub
deploy_dockerhub() {
    echo "Enter your Docker Hub username:"
    read username

    echo "Tagging image..."
    docker tag murach-survey-app $username/murach-survey-app:latest

    echo "Pushing to Docker Hub..."
    docker push $username/murach-survey-app:latest

    echo ""
    echo "Deployment complete!"
    echo "Image available at: $username/murach-survey-app:latest"
}

# Main loop
while true; do
    show_menu
    read -p "Enter your choice (1-8): " choice

    case $choice in
        1)
            build_and_run
            ;;
        2)
            build_only
            ;;
        3)
            run_only
            ;;
        4)
            stop_app
            ;;
        5)
            view_logs
            ;;
        6)
            cleanup
            ;;
        7)
            deploy_dockerhub
            ;;
        8)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac

    echo ""
    read -p "Press Enter to continue..."
    clear
done

