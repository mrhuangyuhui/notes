# Servlet 异步处理

要编写支持异步处理的 Servlet 或过滤器，需设置 `asyncSupported` 属性为 `true`：
```java
@WebServlet(asyncSupported = true ...)
@WebFilter(asyncSupported = true ...)
```

此外，也可以在部署文件里面指定这个描述符。
```xml
<servlet>
    <servlet-name>AsyncServlet</servlet-name>
    <servlet-class>servlet.MyAsyncServlet</servlet-class>
    <async-supported>true</async-supported>
</servlet>
```

示例一：
```java
package servlet;

import javax.servlet.AsyncContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AsyncDispatchServlet",
        urlPatterns = {"/asyncDispatch"},
        asyncSupported = true)
public class AsyncDispatchServlet extends HttpServlet {

    private static final long serialVersionUID = 222L;

    @Override
    protected void doGet(final HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        final AsyncContext asyncContext = req.startAsync();
        req.setAttribute("mainThread", Thread.currentThread().getName());
        asyncContext.setTimeout(5000);
        asyncContext.start(new Runnable() {
            public void run() {
                try {
                    Thread.sleep(3000);
                } catch (InterruptedException e) {
                    //
                }
                req.setAttribute("workerThread", Thread.currentThread().getName());
                asyncContext.dispatch("/threadNames.jsp");
            }
        });
    }
}
```

示例二：
```java
package servlet;

import javax.servlet.AsyncContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AsyncCompleteServlet extends HttpServlet {

    private static final long serialVersionUID = 78234L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        final PrintWriter writer = resp.getWriter();
        writer.println("<html><head><title>" +
                "Async Servlet</title></head>");
        writer.println("<body><div id='progress'></div>");
        writer.println("</body></html>");
        final AsyncContext asyncContext = req.startAsync();
        asyncContext.setTimeout(60000);
        asyncContext.start(new Runnable() {
            public void run() {
                System.out.println("new thread:" +
                        Thread.currentThread());
                for (int i = 0; i < 10; i++) {
                    writer.println("<script>");
                    writer.println("document.getElementById(" +
                            "'progress').innerHTML = '" +
                            (i * 10) + "% complete'");
                    writer.println("</script>");
                    writer.flush();
                    try {
                        Thread.sleep(1000);
                    } catch (InterruptedException e) {
                    }
                }
                writer.println("<script>");
                writer.println("document.getElementById(" +
                        "'progress').innerHTML = 'DONE'");
                writer.println("</script>");
                asyncContext.complete();
            }
        });
    }
}
```

示例三：
```java
package listener;

import javax.servlet.AsyncEvent;
import javax.servlet.AsyncListener;
import java.io.IOException;

public class MyAsyncListener implements AsyncListener {

    public void onComplete(AsyncEvent asyncEvent) throws IOException {
        System.out.println("onComplete");
    }

    public void onTimeout(AsyncEvent asyncEvent) throws IOException {
        System.out.println("onTimeout");
    }

    public void onError(AsyncEvent asyncEvent) throws IOException {
        System.out.println("onError");
    }

    public void onStartAsync(AsyncEvent asyncEvent) throws IOException {
        System.out.println("onStartAsync");
    }
}
```

```java
package servlet;

import listener.MyAsyncListener;

import javax.servlet.AsyncContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AsyncListenerServlet", urlPatterns = {"/asyncListener"}, asyncSupported = true)
public class AsyncListenerServlet extends HttpServlet {
    private static final long serialVersionUID = 62738L;

    @Override
    protected void doGet(final HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        final AsyncContext asyncContext = req.startAsync();
        asyncContext.setTimeout(5000);
        asyncContext.addListener(new MyAsyncListener());
        asyncContext.start(new Runnable() {
            public void run() {
                try {
                    Thread.sleep(3000);
                } catch (InterruptedException e) {
                }
                String greeting = "hi from listener";
                System.out.println("wait....");
                req.setAttribute("greeting", greeting);
                asyncContext.dispatch("/test.jsp");
            }
        });
    }
}
```