FROM openjdk:8

WORKDIR /var/lib/jenkins/workspace/ProjectFutureTeam6_development/src/myapp

COPY . /var/lib/jenkins/workspace/ProjectFutureTeam6_development/src/myapp

ENTRYPOINT ["java","-cp", "toDoAppWithLogin.jar", "org.springframework.boot.loader.JarLauncher", "--my_sql.host=mysql-container", "--my_sql.port=3306"]