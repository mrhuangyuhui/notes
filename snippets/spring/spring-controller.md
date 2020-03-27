# Spring Controller

## API

- `@Controller` 请求地址映射到控制器类
- `@RequestMapping` 请求地址映射到请求处理方法
- `@ResponseBody` 请求处理方法的返回值绑定到响应体
- `@RequestParam` 查询参数绑定到请求处理方法的参数
- `@RequestBody` 请求体绑定到请求处理方法的参数

## Notes

Spring Framework Reference Documentation - [22.13.1 The Controller ControllerClassNameHandlerMapping](https://gitee.com/mrhuangyuhui/notes/blob/master/tutorials/spring/spring-ref/mvc.md#22131-the-controller-controllerclassnamehandlermapping)

《Servlet、JSP 和 Spring MVC 初学指南》[18.2 编写请求处理方法](http://mrhuangyuhui.gitee.io/books/WXdgH8_files/text/part0024.html#nav_point_262)

## Snippets

```java
// 注解控制器类
@Controller
public class RedPacketActController extends AbstractRedPacketController
```

```java
// 自动绑定查询参数到方法参数，查询参数的名字和方法参数的名字一致。
@RequestMapping(value = "/listSelectedStores", method = RequestMethod.GET)
@ResponseBody
public ApiModel listAllSelectedStores(Long actId, HttpServletRequest request)

// 查询参数的名字和对象的字段名一致
@RequestMapping(value = "/queryActList", method = RequestMethod.GET)
@ResponseBody
public ApiModel queryActList(HttpServletRequest request, RedPacketActForm form)
```

```java
// 显式绑定查询参数到方法参数
@RequestMapping(value = "/updateOnline", method = RequestMethod.GET)
@ResponseBody
public ApiModel updateOnline(HttpServletRequest request, @RequestParam Boolean online, @RequestParam Long actId)
```

```java
// 请求体绑定到方法参数
@RequestMapping(value = "/saveAct", method = RequestMethod.POST)
@ResponseBody
public ApiModel saveAct(HttpServletRequest request, @RequestBody RedPacketActDTO dto)
```

```java
// 指定查询参数的默认值
@RequestMapping(value = "/appList", method = RequestMethod.GET)
@ResponseBody
public PageModel getPacketList(long actId, String clerkPhone, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "20") Integer count)
```

```java
// 请求体绑定到 HashMap
@RequestMapping(value = "/saveConfigs", method = RequestMethod.POST)
@ResponseBody
public ApiModel saveConfigs(HttpServletRequest request, @RequestBody HashMap map)
```

```java
// 上传文件绑定到参数
@RequestMapping(value = "/uploadXls", method = RequestMethod.POST)
@ResponseBody
public ApiModel updateXlsFile(HttpServletRequest request, Long actId, @RequestParam(value = "file", required = false) MultipartFile file)
```