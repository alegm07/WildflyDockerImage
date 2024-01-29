# Configuration Details
* The setup-user.sh script should provide the logic to configure WildFly users and will be executed upon container startup.

* The standalone.xml file is modified to change the default IP addresses used by WildFly.

* The container exposes ports 8080 and 9990 to access deployed applications and the WildFly management console, respectively.

* Users can configure a user for the WildFly console using the following environment variables:

  * WILDFLY_USER: The username for accessing the WildFly console.
  * WILDFLY_PASSWORD: The password for accessing the WildFly console.

* The CMD command starts WildFly by running standalone.sh in the /opt/wildfly/bin/ directory.




# Development commands
* Create image
```bash 
docker build . --tag wildfly31:1.0.0
```

## Test container

* Create Container
```bash 
docker run --name wildfly31 -d -p 8080:8080 -p 9990:9990 -e WILDFLY_USER=admin -e WILDFLY_PASSWORD=password wildfly31:1.0.0
```
