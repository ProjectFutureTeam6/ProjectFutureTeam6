FROM openjdk:8

WORKDIR /urs/src/myapp

COPY /workspace/ProjectFutureTeam6_main/target/toDoAppWithLogin.jar /usr/src/myapp

ENTRYPOINT ["java","-cp", "toDoAppWithLogin.jar", "org.springframework.boot.loader.JarLauncher", "--my_sql.host=mysql-container", "--my_sql.port=3306"]