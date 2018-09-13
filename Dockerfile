FROM erodriguezg/tomcat-redis:8.5-4.0

RUN rm -rf $CATALINA_HOME/webapps/*
COPY target/springboot-thymeleaf-1.0.0.war.original $CATALINA_HOME/webapps/ROOT.war

CMD ["catalina.sh", "run"]