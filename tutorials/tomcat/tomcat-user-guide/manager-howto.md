# [Manager](http://tomcat.apache.org/tomcat-8.5-doc/manager-howto.html)

## [Configuring Manager Application Access](http://tomcat.apache.org/tomcat-8.5-doc/manager-howto.html#Configuring_Manager_Application_Access)

- manager-gui — Access to the HTML interface.
- manager-status — Access to the "Server Status" page only.
- manager-script — Access to the tools-friendly plain text interface that is described in this document, and to the "Server Status" page.
- manager-jmx — Access to JMX proxy interface and to the "Server Status" page.

## [HTML User-friendly Interface](http://tomcat.apache.org/tomcat-8.5-doc/manager-howto.html#HTML_User-friendly_Interface)

`http://{host}:{port}/manager/html`

[HTML Manager documentation](http://tomcat.apache.org/tomcat-8.5-doc/html-manager-howto.html)

## [Server Status](http://tomcat.apache.org/tomcat-8.5-doc/manager-howto.html#Server_Status)

HTML 格式

<http://localhost:8080/manager/status>

<http://localhost:8080/manager/status/all>

XML 格式

<http://localhost:8080/manager/status?XML=true>

<http://localhost:8080/manager/status/all?XML=true>