@echo off
echo Building Spring Boot app...
call mvnw.cmd clean package
if %ERRORLEVEL% neq 0 (
    echo Build failed. Please check the error above.
    pause
    exit /b %ERRORLEVEL%
)

echo Starting app on http://localhost:8080 ...
java -jar target\demo.jar
pause
