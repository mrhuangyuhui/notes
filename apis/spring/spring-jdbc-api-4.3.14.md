# Spring JDBC API

---

[TOC]

## [Package `org.springframework.jdbc.core`](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/core/package-summary.html)

- [Interface BatchPreparedStatementSetter](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/core/BatchPreparedStatementSetter.html)
  - getBatchSize
  - setValues
- [Interface ParameterizedPreparedStatementSetter<T>](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/core/ParameterizedPreparedStatementSetter.html)
- [Interface PreparedStatementCreator](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/core/PreparedStatementCreator.html)
  - createPreparedStatement
- [Interface RowCallbackHandler](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/core/RowCallbackHandler.html)
  - processRow
- [Interface RowMapper<T>](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/core/RowMapper.html)
  - mapRow
- [Class JdbcTemplate](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/core/JdbcTemplate.html)
  - batchUpdate
  - execute
  - query
  - queryForObject
  - update
- [Class SqlOutParameter](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/core/SqlOutParameter.html)
- [Class SqlParameter](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/core/SqlParameter.html)

## [Package `org.springframework.jdbc.core.namedparam`](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/core/namedparam/package-summary.html)

- [Interface SqlParameterSource](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/core/namedparam/SqlParameterSource.html)
- [Class BeanPropertySqlParameterSource](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/core/namedparam/BeanPropertySqlParameterSource.html)
- [Class MapSqlParameterSource](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/core/namedparam/MapSqlParameterSource.html)
  - addValue
- [Class NamedParameterJdbcTemplate](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/core/namedparam/NamedParameterJdbcTemplate.html)
  - batchUpdate
  - queryForObject
- [Class SqlParameterSourceUtils](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/core/namedparam/SqlParameterSourceUtils.html)
  - createBatch

## [Package `org.springframework.jdbc.core.simple`](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/core/simple/package-summary.html)

- [Class SimpleJdbcCall](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/core/simple/SimpleJdbcCall.html)
- [Class SimpleJdbcInsert](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/core/simple/SimpleJdbcInsert.html)

## [Package `org.springframework.jdbc.core.support`](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/core/support/package-summary.html)

- [Class JdbcDaoSupport](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/core/support/JdbcDaoSupport.html)

## [Package `org.springframework.jdbc.object`](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/object/package-summary.html)

- [Class MappingSqlQuery<T>](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/object/MappingSqlQuery.html)
- [Class SqlQuery<T>](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/object/SqlQuery.html)
- [Class SqlUpdate](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/object/SqlUpdate.html)
- [Class StoredProcedure](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/object/StoredProcedure.html)

## [Package `org.springframework.jdbc.support`](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/support/package-summary.html)

- [Interface KeyHolder](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/support/KeyHolder.html)
  - getKey
- [Interface SQLExceptionTranslator](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/support/SQLExceptionTranslator.html)
- [Class GeneratedKeyHolder](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/support/GeneratedKeyHolder.html)
  - getKey
- [Class SQLErrorCodeSQLExceptionTranslator](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/jdbc/support/SQLErrorCodeSQLExceptionTranslator.html)