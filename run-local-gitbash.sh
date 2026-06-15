#!/bin/bash
set -e

echo "Building Spring Boot app..."
./mvnw clean package

echo "Starting app on http://localhost:8080 ..."
java -jar target/demo.jar
