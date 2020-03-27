# Spring Session

在普通类中获取 Session

```java
protected HttpSession getSession() throws Exception {
    return ((ServletRequestAttributes) RequestContextHolder
            .currentRequestAttributes()).getRequest().getSession();
}
// 让 Session 过期
protected void invalidate() throws Exception {
    HttpSession session = getSession();
    session.invalidate();
}
```