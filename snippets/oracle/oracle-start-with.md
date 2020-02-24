# Oracle START WITH

```java
// 查询某个门店所有层级（树状结构）的下级门店
public List<StoreDTO> listAllSubNodesOfParentNo(String parentStoreNo, String storeType) {
    String sql = "SELECT row_id AS store_id, bh_name AS store_name, bh_no AS store_no, partner_type AS store_type FROM siebel.RPT_PARTNERRELLIST_V " +
            "WHERE 1 = 1 " + condition.toString() + " START WITH bh_no = ? CONNECT BY PRIOR row_id = par_row_id";
}

// 查询某个门店所有层级（树状结构）的上级门店
public List<StoreDTO> listAllParentNodesByStoreNo(String storeNo) {
    String sql = "SELECT row_id AS store_id, bh_name AS store_name, bh_no AS store_no, partner_type AS store_type FROM siebel.RPT_PARTNERRELLIST_V " +
            " WHERE bh_no != 'TCBJ' START WITH bh_no = ? CONNECT BY PRIOR par_row_id = row_id";
}
```