# Spring Response

在普通类中获取 Response

```java
((ServletRequestAttributes) RequestContextHolder
            .currentRequestAttributes()).getResponse()
```

返回提示信息

```java
protected void writeMsg(HttpServletResponse response, String msg) {
    OutputStream out = null;
    try {
        response.setContentType("text/plain;charset=UTF-8");
        out = response.getOutputStream();
        out.write(msg.getBytes("UTF-8"));
        out.flush();
        logger.info(msg);
    } catch (Exception e) {
        e.printStackTrace();
        logger.error("" + e);
    } finally {
        if (out != null)
            try {
                out.close();
            } catch (IOException e) {
                //
            }
    }
}
```