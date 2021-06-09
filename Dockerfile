FROM openjdk:8

WORKDIR /usr/src/myapp

COPY . /usr/src/myapp

ENTRYPOINT ["java","-cp", "toDoAppWithLogin.jar", "org.springframework.boot.loader.JarLauncher", "--my_sql.host=mysql-container", "--my_sql.port=3306"]