[TOC]

# JDBC Basics

https://docs.oracle.com/javase/tutorial/jdbc/basics/index.html

## Getting Started
https://docs.oracle.com/javase/tutorial/jdbc/basics/gettingstarted.html

n/a

## Processing SQL Statements with JDBC
https://docs.oracle.com/javase/tutorial/jdbc/basics/processingsqlstatements.html

> In general, to process any SQL statement with JDBC, you follow these steps:
> 
> 1. Establishing a connection.
> 1. Create a statement.
> 1. Execute the query.
> 1. Process the ResultSet object.
> 1. Close the connection.


> There are three different kinds of statements:
> 
> - Statement: Used to implement simple SQL statements with no parameters.
> - PreparedStatement: (Extends Statement.) Used for precompiling SQL statements that might contain input parameters.
> - CallableStatement: (Extends PreparedStatement.) Used to execute stored procedures that may contain both input and output parameters.

> To execute a query, call an execute method from Statement such as the following:
> 
> - execute: Returns true if the first object that the query returns is a ResultSet object. Use this method if the query could return one or more ResultSet objects. Retrieve the ResultSet objects returned from the query by repeatedly calling Statement.getResultSet.
> - executeQuery: Returns one ResultSet object.
> - executeUpdate: Returns an integer representing the number of rows affected by the SQL statement. Use this method if you are using INSERT, DELETE, or UPDATE SQL statements.

### Establishing a Connection
https://docs.oracle.com/javase/tutorial/jdbc/basics/connecting.html

> Typically, a JDBC application connects to a target data source using one of two classes:
> 
> - DriverManager: This fully implemented class connects an application to a data source, which is specified by a database URL. When this class first attempts to establish a connection, it automatically loads any JDBC 4.0 drivers found within the class path. Note that your application must manually load any JDBC drivers prior to version 4.0.
> - 
> - DataSource: This interface is preferred over DriverManager because it allows details about the underlying data source to be transparent to your application. A DataSource object's properties are set so that it represents a particular data source. See Connecting with DataSource Objects for more information. For more information about developing applications with the DataSource class, see the latest The Java EE Tutorial.

> The following is the database connection URL syntax for MySQL Connector/J:
> ```
> jdbc:mysql://[host][,failoverhost...]
>     [:port]/[database]
>     [?propertyName1][=propertyValue1]
>     [&propertyName2][=propertyValue2]...
> ```
> - host:port is the host name and port number of the computer hosting your database. If not specified, the default values of host and port are 127.0.0.1 and 3306, respectively.
> - database is the name of the database to connect to. If not specified, a connection is made with no default database.
> - failover is the name of a standby database (MySQL Connector/J supports failover).
> - propertyName=propertyValue represents an optional, ampersand-separated list of properties. These attributes enable you to instruct MySQL Connector/J to perform various tasks.

### Connecting with DataSource Objects
https://docs.oracle.com/javase/tutorial/jdbc/basics/sqldatasources.html

n/a

### Handling SQLExceptions
https://docs.oracle.com/javase/tutorial/jdbc/basics/sqlexception.html

n/a

### Setting Up Tables
https://docs.oracle.com/javase/tutorial/jdbc/basics/tables.html

n/a

### Retrieving and Modifying Values from Result Sets
https://docs.oracle.com/javase/tutorial/jdbc/basics/retrieving.html

> The sensitivity of a ResultSet object is determined by one of three different ResultSet types:
> 
> - TYPE_FORWARD_ONLY: The result set cannot be scrolled; its cursor moves forward only, from before the first row to after the last row. The rows contained in the result set depend on how the underlying database generates the results. That is, it contains the rows that satisfy the query at either the time the query is executed or as the rows are retrieved.
> - TYPE_SCROLL_INSENSITIVE: The result can be scrolled; its cursor can move both forward and backward relative to the current position, and it can move to an absolute position. The result set is insensitive to changes made to the underlying data source while it is open. It contains the rows that satisfy the query at either the time the query is executed or as the rows are retrieved.
> - TYPE_SCROLL_SENSITIVE: The result can be scrolled; its cursor can move both forward and backward relative to the current position, and it can move to an absolute position. The result set reflects changes made to the underlying data source while the result set remains open.
> 
> The default ResultSet type is TYPE_FORWARD_ONLY.

> The concurrency of a ResultSet object determines what level of update functionality is supported.
> 
> There are two concurrency levels:
> 
> - CONCUR_READ_ONLY: The ResultSet object cannot be updated using the ResultSet interface.
> - CONCUR_UPDATABLE: The ResultSet object can be updated using the ResultSet interface.
> - 
> The default ResultSet concurrency is CONCUR_READ_ONLY.

> Calling the method Connection.commit can close the ResultSet objects that have been created during the current transaction. In some cases, however, this may not be the desired behavior. The ResultSet property holdability gives the application control over whether ResultSet objects (cursors) are closed when commit is called.
> 
> The following ResultSet constants may be supplied to the Connection methods createStatement, prepareStatement, and prepareCall:
> 
> - HOLD_CURSORS_OVER_COMMIT: ResultSet cursors are not closed; they are holdable: they are held open when the method commit is called. Holdable cursors might be ideal if your application uses mostly read-only ResultSet objects.
> - CLOSE_CURSORS_AT_COMMIT: ResultSet objects (cursors) are closed when the commit method is called. Closing cursors when this method is called can result in better performance for some applications.
> 
> The default cursor holdability varies depending on your DBMS.

### Using Prepared Statements
https://docs.oracle.com/javase/tutorial/jdbc/basics/prepared.html

n/a

### Using Transactions
https://docs.oracle.com/javase/tutorial/jdbc/basics/transactions.html

n/a

## Using RowSet Objects
https://docs.oracle.com/javase/tutorial/jdbc/basics/rowset.html

Pass

## Using Advanced Data Types
https://docs.oracle.com/javase/tutorial/jdbc/basics/sqltypes.html

Pass

