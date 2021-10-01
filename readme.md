# Spring Boot @RestController Example with Chaos Monkey Enabled in Spring Application Properties

## Description

This project contains the sample code used in [The Practical Developer Blog](https://thepracticaldeveloper.com/2017/03/04/restcontroller-spring-boot-example-with-springfox-swagger/). It's a Spring Boot application with one plain Java object (`SpanishGreeting`) and a Spring Controller `SpanishGreetingController`.

The main goal of the project is to show how to write a `@RestController` in Spring Boot and include documentation with Swagger.
 
## How does it work?

You can use the endpoints behind `http://localhost:8080/spanish-greetings`. If you append `/random` to a `GET` request you'll receive a random Spanish greeting (which are actually hard-coded). You can also `GET` them by `id` (only from 1 to 3). To create a new one, you need to perform a `POST` operation.

Actually, much better if you just start the application and navigate to `http://localhost:8080/swagger-ui.html`. There you'll find a nice API documentation thanks to Swagger. Moreover, *you can play with it*.

![Swagger Documentation](images/swagger.png)

![image](https://user-images.githubusercontent.com/50335583/135618904-26996ad8-1824-4d03-a97c-4e878b8ef2a2.png)
![image](https://user-images.githubusercontent.com/50335583/135619103-a6322eba-2fb0-4df9-847c-68daf95f5a6b.png)
![image](https://user-images.githubusercontent.com/50335583/135619155-9b62c70a-b8fa-4028-b11a-d58f2ba09b75.png)


