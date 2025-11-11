@echo off
echo ========================================
echo   Murach Survey App - Docker Builder
echo ========================================
echo.

:menu
echo Select an option:
echo 1. Build and Run (Docker Compose)
echo 2. Build Only
echo 3. Run Only
echo 4. Stop Application
echo 5. View Logs
echo 6. Remove Containers and Images
echo 7. Exit
echo.

set /p choice="Enter your choice (1-7): "

if "%choice%"=="1" goto buildrun
if "%choice%"=="2" goto build
if "%choice%"=="3" goto run
if "%choice%"=="4" goto stop
if "%choice%"=="5" goto logs
if "%choice%"=="6" goto clean
if "%choice%"=="7" goto end

echo Invalid choice. Please try again.
goto menu

:buildrun
echo.
echo Building and starting application...
docker-compose up --build -d
echo.
echo Application is starting...
echo Access at: http://localhost:8080
echo.
pause
goto menu

:build
echo.
echo Building Docker image...
docker build -t murach-survey-app .
echo.
echo Build complete!
pause
goto menu

:run
echo.
echo Starting application...
docker run -d -p 8080:8080 --name murach-survey murach-survey-app
echo.
echo Application started!
echo Access at: http://localhost:8080
pause
goto menu

:stop
echo.
echo Stopping application...
docker-compose down
echo.
echo Application stopped!
pause
goto menu

:logs
echo.
echo Fetching logs...
docker-compose logs
echo.
pause
goto menu

:clean
echo.
echo Removing containers and images...
docker-compose down
docker rmi murach-survey-app
docker system prune -f
echo.
echo Cleanup complete!
pause
goto menu

:end
echo.
echo Goodbye!
exit

