# [Packaging Web Archives](https://javaee.github.io/tutorial/packaging003.html#BCGHAHGD)

> A web module has a specific structure. The top-level directory of a web module is the document root of the application. The document root is where XHTML pages, client-side classes and archives, and static web resources, such as images, are stored.
> 
> The document root contains a subdirectory named WEB-INF, which can contain the following files and directories:
> 
> - classes, a directory that contains server-side classes: servlets, enterprise bean class files, utility classes, and JavaBeans components
> 
> - lib, a directory that contains JAR files that contain enterprise beans, and JAR archives of libraries called by server-side classes
> 
> - Deployment descriptors, such as web.xml (the web application deployment descriptor) and ejb-jar.xml (an EJB deployment descriptor)

> You can also create application-specific subdirectories (that is, package directories) in either the document root or the WEB-INF/classes/ directory.