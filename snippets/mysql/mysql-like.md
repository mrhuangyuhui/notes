# MySQL `LIKE` 语句

```java
if (StringUtil.isNotEmptyORNull(form.getClerkName())) {
    builder.append(" AND record.clerk_name LIKE CONCAT('%', ?, '%')");
    params.add(form.getClerkName());
}
if (StringUtil.isNotEmptyORNull(form.getReceiptNum())) {
    builder.append(" AND record.receipt_num  LIKE CONCAT('%', ?, '%')");
    params.add(form.getReceiptNum());
}
```