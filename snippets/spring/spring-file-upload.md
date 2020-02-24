# Spring File Upload

API

- [Interface MultipartFile](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/web/multipart/MultipartFile.html)
- [Interface MultipartHttpServletRequest](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/web/multipart/MultipartHttpServletRequest.html)

```java
// 保存上传文件
@RequestMapping(value = "/uploadXls", method = RequestMethod.POST)
@ResponseBody
public ApiModel updateXlsFile(HttpServletRequest request, Long actId, @RequestParam(value = "file", required = false) MultipartFile file) {
    // 文件保存路径
    String path = request.getSession().getServletContext().getRealPath(UPLOAD_PATH);
    String completePath = path + File.separator + "excel" + File.separator + "redpacket" + File.separator + filename;
    // 保存文件到服务器
    try {
        FileOutputStream fos = new FileOutputStream(completePath);
        fos.write(file.getBytes());
        fos.close();
        return buildSuccMsg(filename);
    } catch (Exception e) {
        return buildErrorMsg(null, EXCEPTION, "无法保存文件");
    }
}
```

```java
// 上传多个文件
@RequestMapping
@ResponseBody
public ApiModel updatePhotoUrl(String userName, HttpServletRequest request) throws Exception {
    // 文件保存路径
    String savePath = request.getServletContext().getRealPath("/") + FileUploadUtil.UPLOAD_PATH;
    MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
    // 获取文件列表
    List<MultipartFile> fileList = multipartRequest.getFiles("file");
}
```