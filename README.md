# Spring Boot Jenkins AWS Demo App

This is a complete Spring Boot project with your `HelloController`.

## Folder structure

```text
SpringBoot-Jenkins-Demo/
├── pom.xml
├── Jenkinsfile
├── mvnw
├── mvnw.cmd
├── run-local-windows.bat
├── run-local-gitbash.sh
├── src/
│   ├── main/
│   │   ├── java/com/example/demoapp/
│   │   │   ├── DemoappApplication.java
│   │   │   └── HelloController.java
│   │   └── resources/application.properties
│   └── test/java/com/example/demoapp/DemoappApplicationTests.java
└── scripts/run-app.sh
```

## Run on Windows using VS Code / Git Bash

Open terminal inside this project folder.

### Option 1: If Maven is installed

```bash
mvn clean package
java -jar target/demo.jar
```

### Option 2: If `mvn` command is not found

Use Maven Wrapper:

```bash
./mvnw clean package
java -jar target/demo.jar
```

In Windows Command Prompt / PowerShell:

```bat
mvnw.cmd clean package
java -jar target\demo.jar
```

## Open in browser

Keep the terminal running, then open:

```text
http://localhost:8080/
http://localhost:8080/hello
```

Expected output:

```text
Java application deployed successfully using Jenkins on AWS!
```

and

```text
Hello from Jenkins CI/CD pipeline!
```

## Stop the app

Press:

```text
CTRL + C
```

## Common error: localhost refused to connect

This means the app is not running. First run:

```bash
java -jar target/demo.jar
```

Keep that terminal open and then refresh the browser.

## Push to GitHub

```bash
git init
git add .
git commit -m "Add Spring Boot Jenkins demo app"
git branch -M main
git remote add origin YOUR_GITHUB_REPO_URL
git push -u origin main
```

## Jenkins build command

The included `Jenkinsfile` builds the project using Maven Wrapper:

```bash
./mvnw clean package
```

It creates:

```text
target/demo.jar
```
