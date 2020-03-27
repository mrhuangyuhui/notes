# [Java EE 7 API](https://docs.oracle.com/javaee/7/api/overview-summary.html)

[All Classes](https://docs.oracle.com/javaee/7/api/allclasses-noframe.html)

---

[TOC]

## [Package `javax.persistence`](https://docs.oracle.com/javaee/7/api/javax/persistence/package-summary.html)

- [Enum GenerationType](https://docs.oracle.com/javaee/7/api/javax/persistence/GenerationType.html)
  - IDENTITY
- [Annotation Type Column](https://docs.oracle.com/javaee/7/api/javax/persistence/Column.html)
  - length
  - name
  - nullable
  - table
  - unique
- [Annotation Type Entity](https://docs.oracle.com/javaee/7/api/javax/persistence/Entity.html)
  - name
- [Annotation Type GeneratedValue](https://docs.oracle.com/javaee/7/api/javax/persistence/GeneratedValue.html)
  - strategy
- [Annotation Type Id](https://docs.oracle.com/javaee/7/api/javax/persistence/Id.html)
- [Annotation Type Table](https://docs.oracle.com/javaee/7/api/javax/persistence/Table.html)
  - catalog
  - name

## [Package `javax.servlet`](https://docs.oracle.com/javaee/7/api/javax/servlet/package-summary.html)

- [Interface AsyncContext](https://docs.oracle.com/javaee/7/api/javax/servlet/AsyncContext.html)
  - addListener
  - dispatch
  - setTimeout
  - start
  - startAsync
- [Interface AsyncListener](https://docs.oracle.com/javaee/7/api/javax/servlet/AsyncListener.html)
- [Interface Filter](https://docs.oracle.com/javaee/7/api/javax/servlet/Filter.html)
- [Interface FilterChain](https://docs.oracle.com/javaee/7/api/javax/servlet/FilterChain.html)
- [Interface FilterConfig](https://docs.oracle.com/javaee/7/api/javax/servlet/FilterConfig.html)
  - getInitParameter
  - getServletContext
- [Interface RequestDispatcher](https://docs.oracle.com/javaee/7/api/javax/servlet/RequestDispatcher.html)
  - forward
- [Interface Servlet](https://docs.oracle.com/javaee/7/api/javax/servlet/Servlet.html)
- [Interface ServletConfig](https://docs.oracle.com/javaee/7/api/javax/servlet/ServletConfig.html)
  - getServletContext
- [Interface ServletContext](https://docs.oracle.com/javaee/7/api/javax/servlet/ServletContext.html)
  - getRealPath
  - setAttribute
- [Interface ServletContextListener](https://docs.oracle.com/javaee/7/api/javax/servlet/ServletContextListener.html)
- [Interface ServletRegistration](https://docs.oracle.com/javaee/7/api/javax/servlet/ServletRegistration.html)
- [Interface ServletRegistration.Dynamic](https://docs.oracle.com/javaee/7/api/javax/servlet/ServletRegistration.Dynamic.html)
- [Interface ServletRequest](https://docs.oracle.com/javaee/7/api/javax/servlet/ServletRequest.html)
  - getAttribute
  - getParameter
  - getParameterNames
  - getParameterMap
  - getParameterValues
  - getRequestDispatcher
  - setAttribute
- [Interface ServletRequestListener](https://docs.oracle.com/javaee/7/api/javax/servlet/ServletRequestListener.html)
- [Interface ServletResponse](https://docs.oracle.com/javaee/7/api/javax/servlet/ServletResponse.html)
- [Class AsyncEvent](https://docs.oracle.com/javaee/7/api/javax/servlet/AsyncEvent.html)
- [Class GenericServlet](https://docs.oracle.com/javaee/7/api/javax/servlet/GenericServlet.html)
- [Class ServletContextEvent](https://docs.oracle.com/javaee/7/api/javax/servlet/ServletContextEvent.html)
  - getServletContext
- [Class ServletException](https://docs.oracle.com/javaee/7/api/javax/servlet/ServletException.html)
- [Class ServletRequestEvent](https://docs.oracle.com/javaee/7/api/javax/servlet/ServletRequestEvent.html)
  - getServletRequest
- [Class ServletRequestWrapper](https://docs.oracle.com/javaee/7/api/javax/servlet/ServletRequestWrapper.html)

## [Package `javax.servlet.annotation`](https://docs.oracle.com/javaee/7/api/javax/servlet/annotation/package-summary.html)

- [Annotation Type WebInitParam](https://docs.oracle.com/javaee/7/api/javax/servlet/annotation/WebInitParam.html)
- [Annotation Type WebListener](https://docs.oracle.com/javaee/7/api/javax/servlet/annotation/WebListener.html)
- [Annotation Type WebServlet](https://docs.oracle.com/javaee/7/api/javax/servlet/annotation/WebServlet.html)
  - asyncSupported
  - urlPatterns

## [Package `javax.servlet.http`](https://docs.oracle.com/javaee/7/api/javax/servlet/http/package-summary.html)

- [Interface HttpServletRequest](https://docs.oracle.com/javaee/7/api/javax/servlet/http/HttpServletRequest.html)
  - getCookies
  - getSession
  - setAttribute
- [Interface HttpServletResponse](https://docs.oracle.com/javaee/7/api/javax/servlet/http/HttpServletResponse.html)
  - addCookie
- [Interface HttpSession](https://docs.oracle.com/javaee/7/api/javax/servlet/http/HttpSession.html)
  - getAttribute
  - getServletContext
- [Interface HttpSessionListener](https://docs.oracle.com/javaee/7/api/javax/servlet/http/HttpSessionListener.html)
- [Class Cookie](https://docs.oracle.com/javaee/7/api/javax/servlet/http/Cookie.html)
- [Class HttpServlet](https://docs.oracle.com/javaee/7/api/javax/servlet/http/HttpServlet.html)
- [Class HttpServletRequestWrapper](https://docs.oracle.com/javaee/7/api/javax/servlet/http/HttpServletRequestWrapper.html)
- [Class HttpSessionEvent](https://docs.oracle.com/javaee/7/api/javax/servlet/http/HttpSessionEvent.html)
  - getSession