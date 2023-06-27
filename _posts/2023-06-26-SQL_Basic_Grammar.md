---
layout: post
title: SQL Basic Grammar
image: 2023-06-26-SQL_Basic_Grammar/banner.png
date: 2023-06-26
tags: [SQL Query]
categories: DB
---

# SQL 기초 문법

<br>

# 1. SQL사용시 기초

---

## 1.1 Hello world

SQL Query는 주어진 DB에서 원하는 데이터만 불러오기 위한 질의문(조건? 형식? 언어?)이다.  
스키마 ⊃ 테이블 ⊃ 컬럼(열, Column)로 속해있다고 보면 된다.  
모든 작명 및 명령어는 대문자로 이루어진다.

문법을 통해 특정 테이블로 불러오더라도,  
보여지지 않는 조건으로 정렬하거나 할 수 있다.

SQL Query는 DB에서 **어떤 데이터를 선택** 하고,  
어떤 데이터를 DB에서 추가/제거할지 결정하는 문법이라고 보면 된다.
<br>

# 2. SQL기초 문법

SQL문법을 조작하는 내용에 따라 조작어/정의어/제어어로 나눈다고 하는데, 전체 문법수가 그리 많지 않으므로 따로 구분하지는 않으나, 순서대로 서술한다.  
문법의 구분기준을 간단히 보자면 다음과 같다.

> **데이터 조작어** : 데이터베이스에서 필요한 데이터를 추출하기 위해 가공하는 문법
> - SELECT, INSERT, UPDATE, DELETE

> **데이터 정의어** : 데이터베이스 <U>테이블</U>을 구성, 변경할때 사용하는 문법   
> - CREATE, ALTER, DROP, RENAME

> **데이터 제어어** : 데이터의 검사, 보안, 무결성 등 관리/검사 목적으로 사용하는 문법
> - GRANT, REVOKE

## 2.1 SELECT

{%highlight sql%}
SELECT *
FROM abc
{%endhighlight%}
필요한 내용들(컬럼 이름)을 선택하고, `SELECT`  
abc라는 이름을 가진 테이블에서 불러온다는 의미`FROM abc`   
여기서, `*`는 전체 컬럼을 불러온다는 의미이므로,   
해당 질의어는 abc테이블 전체를 불러오게 된다.
### 2.1.1 FROM

### 2.1.2 ORDER BY

정렬기준을 선택할 수 있다.
**ASC**(순차정렬)과 **DESC**(역정렬)로 정렬할 수 있으며,  
정렬조건이 여러개라면 뒤의것부터 정렬한 뒤에 앞에것을 정렬한다.

> -- 코드를 입력하세요  
> SELECT ANIMAL_ID, NAME, DATETIME  
> FROM ANIMAL_INS ORDER BY NAME ASC, DATETIME DESC

해당코드는 데이터를 DATETIME기준으로 정렬후에, 이름으로 정렬한다.  
(최종적으로는 이름으로 순차정렬. 이름이 같은 경우에만 날짜로 역정렬)

### 2.1.3 WHERE

기초수식을 조건으로 둘 수 있다.  
프로그래밍과 다르게 등치기호를 `=` 하나만 쓴다.
기초적인 대소비교 및 특정 값과의 비교가 가능하다.

### 2.1.4 LIMIT

정렬갯수에 제한을 걸고싶을 때 사용
`LIMIT 10` 과 같이 사용하면 된다.

<br>
# 2. 내용
---
## 2.1 내용하위제목   
내용본문
