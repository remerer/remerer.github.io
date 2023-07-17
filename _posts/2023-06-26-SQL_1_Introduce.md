---
layout: post
title: SQL Language Introduce
image: 2023-06-26-SQL_Introduce/banner.png
date: 2023-06-26
tags: [MySQL, PostgreSQL, Oracle]
categories: DB
---

# SQL 개요

<br>

# 1. SQL 이란

---

## 1.1 Hello world

SQL Query는 주어진 DB에서 원하는 데이터만 불러오기 위한 질의문(조건? 형식? 언어?)이다.  
스키마 ⊃ 테이블(표) ⊃ 컬럼(열, Column)로 이루어져 있다.  
모든 명령어는 대소문자를 구분하지 않는다.

문법을 통해 특정 테이블로 불러오더라도,  
보여지지 않는 조건으로 정렬하거나 할 수 있다.

SQL Query는 DB에서 **어떤 데이터를 선택** 하고,  
어떤 데이터를 DB에서 **추가/제거할지 결정**하는 문법이라고 보면 된다.   

<br>

# 2. SQL기초 문법

SQL문법을 조작하는 내용에 따라 조작어/정의어/제어어로 나눈다고 한다.  
서로 별도로 사용되는 문법은 아니지만, 조작하는 대상에 따라 세가지로 나뉜다.   

> **데이터 조작어** : 데이터베이스에서 필요한 데이터를 추출하기 위해 가공하는 문법
> 데이터의 컬럼을 조작
> - SELECT, INSERT, UPDATE, DELETE...

> **데이터 정의어** : 데이터베이스 <U>테이블</U>을 구성, 변경할때 사용하는 문법
> 데이터 테이블을 조작
> - CREATE, ALTER, DROP, RENAME...

> **데이터 제어어** : 데이터의 검사, 보안, 무결성 등 관리/검사 목적으로 사용하는 문법
> 그 외의 보안 및 검사항목을 조작
> - GRANT, REVOKE...

<br>

# 3. 연관문서 & 참고자료
---
**연관문서**

**참고자료**
1. [PostgreSQL 키워드](https://www.postgresql.kr/docs/10/sql-keywords-appendix.html)
2. [MySQL 키워드](https://dev.mysql.com/doc/refman/8.0/en/keywords.html)
3. [Oracle 키워드](https://docs.oracle.com/cd/A97630_01/appdev.920/a42525/apb.htm)