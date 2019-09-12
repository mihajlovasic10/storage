# REQUIREMENTS

In order to run the application you must have the following software installed on your machine:
*   Java 8 or better
*   Docker, can be downloaded from [Docker Hub](https://hub.docker.com)

# How to start the application

1.  Make sure that you have Docker up and running by 
typing `docker -v`
2.  If you are using Linux or Mac OS make sure that you have granted the write privilege to `mvnw` (maven wrapper).
If there is no write privilege type `sudo chmod 777 mvnw` in the project folder.
3.  If you are using Windows, you can skip the step 2.
4.  Open the terminal in the project folder if you are using Linux or Mac OS , or _PowerShell_ if you are using Windows and execute the shell script `run-backend.sh` by typing `./run-backend.sh` and pressing enter.
5.  Open the web browser and type in the address bar 
`https://localhost:8080/storage`
6.  You can log in to the system as administrator with credentials:

    email: admin@mail.com <br />
    password: admin

    or as employee with credentials:

    email: employee@mail.com <br />
    password: employee  


# Project structure

Our application is a maven project that uses Hibernate ORM to connect to the PostgreSQL database. It has the following structure: 

| package | description |
| ------- | ----------- |
| `util` | Contains the utility classes for Hibernate session. |
| `entity` | Contains the entity classes for mapping the database tables. |
| `repository` | Contains the generic interfaces and abstract classes for implementing the CRUD operations for entities, as well as concrete implementations of repositories for specified entities. |
| `service` | Contains the generic interfaces and abstract classes for implementing the CRUD operations by wrapping the repository classes, as well as preforming the buisness logic. |
| `servlet` | Contains the _HttpServlet_ classes for handling the HTTP Requests for the pages in our application. |


