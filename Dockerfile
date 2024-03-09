######  #     #   ###   #       ######           #####  #######    #     #####
#     # #     #    #    #       #     #         #     #    #      # #   #     #
#     # #     #    #    #       #     #         #          #     #   #  #
######  #     #    #    #       #     #          #####     #    #     # #  ####
#     # #     #    #    #       #     #               #    #    ####### #     #
#     # #     #    #    #       #     #         #     #    #    #     # #     #
######   #####    ###   ####### ######           #####     #    #     #  ####
FROM maven:3.8.3-openjdk-17 AS builder

ARG SKIP_TEST=false

WORKDIR /build

COPY ./pom.xml .

# Copy source code
COPY ./src ./src

# Build application
RUN mvn -Dmaven.test.skip=$SKIP_TEST package

######  #     # #     #          #####  #######    #     #####  #######
#     # #     # ##    #         #     #    #      # #   #     # #
#     # #     # # #   #         #          #     #   #  #       #
######  #     # #  #  #          #####     #    #     # #  #### #####
#   #   #     # #   # #               #    #    ####### #     # #
#    #  #     # #    ##         #     #    #    #     # #     # #
#     #  #####  #     #          #####     #    #     #  #####  #######
FROM openjdk:17-jdk-slim AS runtime

# Copy the jar file built by Maven into the webapps directory of Tomcat
COPY --from=builder /build/target/*.jar app.jar

# Expose the port that Tomcat will run on
EXPOSE 8080

# Start Tomcat
CMD ["java", "-jar", "app.jar"]
