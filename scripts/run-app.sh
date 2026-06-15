#!/bin/bash
set -e

APP_JAR="target/demo.jar"
APP_LOG="app.log"

if [ ! -f "$APP_JAR" ]; then
  echo "Jar not found: $APP_JAR"
  echo "Run: ./mvnw clean package"
  exit 1
fi

pkill -f "java -jar $APP_JAR" || true
nohup java -jar "$APP_JAR" --server.port=8080 > "$APP_LOG" 2>&1 &

echo "App started on port 8080"
echo "Log file: $APP_LOG"
