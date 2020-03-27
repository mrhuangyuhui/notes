# Spring Request

在普通类中获取 Request

```java
((ServletRequestAttributes) RequestContextHolder
            .currentRequestAttributes()).getRequest()
```

获得请求的完整 URL 地址

```java
protected String getRequestURL(HttpServletRequest request) {
    String queryStr = request.getQueryString();
    String url = "http://"
            + request.getServerName() // 服务器地址
            + ":"
            + ((request.getServerPort() == 80) ? "" : request
            .getServerPort()) // 端口号
            + request.getContextPath() // 项目名称
            + request.getServletPath() // 请求页面或其他地址
            + (StringUtils.isNotBlank(queryStr) ? "?" + queryStr : ""); // 参数
    return url;
}
```